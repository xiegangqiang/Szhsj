package com.xysoft.front.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.xysoft.common.ElementConst;
import com.xysoft.dao.ClassifyDao;
import com.xysoft.dao.HomeDao;
import com.xysoft.dao.ModelDao;
import com.xysoft.dao.PlugMenuDao;
import com.xysoft.dao.WebsiteDao;
import com.xysoft.dao.WxDao;
import com.xysoft.entity.Classify;
import com.xysoft.entity.Home;
import com.xysoft.entity.Model;
import com.xysoft.entity.PlugMenu;
import com.xysoft.entity.Website;
import com.xysoft.entity.Wx;
import com.xysoft.front.service.FrontService;
import com.xysoft.util.JsonUtil;
import com.xysoft.util.NullUtils;
import com.xysoft.weixin.pojo.AccessToken;
import com.xysoft.weixin.template.GovData;
import com.xysoft.weixin.template.GovFirst;
import com.xysoft.weixin.template.GovTemplate;
import com.xysoft.weixin.template.Keyword;
import com.xysoft.weixin.template.Remark;
import com.xysoft.weixin.util.WeixinCacheUtil;
import com.xysoft.weixin.util.WeixinUtil;

@Component
@SuppressWarnings({"unchecked"})
public class FrontServiceImpl implements FrontService {
	@Resource
	private WxDao wxDao;
	@Resource
	private ModelDao modelDao;
	@Resource
	private WebsiteDao websiteDao;
	@Resource
	private ClassifyDao classifyDao;
	@Resource
	private HomeDao homeDao;
	@Resource
	private PlugMenuDao plugMenuDao;
	
	
	@Transactional(readOnly = true)
	public Map<String, Object> test() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("model", "/front/detail/model_1/index");
		return model;
	}
	
	@Transactional(readOnly = true)
	public Map<String, Object> error() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("model", "front/error");
		return model;
	}
	
	@Transactional(readOnly = true)
	public Map<String, Object> index(String wx) {
		Map<String, Object> model = new HashMap<String, Object>();
		if (NullUtils.isNotEmpty(wx)) {
			Model mod = this.modelDao.getModelCache(wx);
			Website website = null;
			if (NullUtils.isNotEmpty(mod.getHometmp())) {
				website = this.websiteDao.getWebsite(mod.getHometmp());
			}
			if (website == null) {
				website = this.websiteDao.getWebsite(ElementConst.Default_HomeTmp);
			}
			List<PlugMenu> menus = this.plugMenuDao.getPlugMenus(wx, true);
			model.put("sys_menus", menus);			
			
			model.put("sys_wx", wx);
			model.put("model", ElementConst.Default_HomeDir + website.getPath());
			
			Home home = this.homeDao.getHome(wx);
			model.put("sys_title", home.getName());
			model.put("sys_siteimg", home.getSiteimg());
			model.put("sys_basePath", ElementConst.Default_SourceHome 
					+ website.getPath().substring(0, website.getPath().indexOf("/")));
		} else {
			model.put("model", "front/index");
		}
		return model;
	}
	
	@Transactional(readOnly = true)
	public Map<String, Object> list(String classify, Integer page) {
		Map<String, Object> model = new HashMap<String, Object>();
		Classify cls = this.classifyDao.getClassifyCache(classify);
		Model mod = this.modelDao.getModelCache(cls.getWx());
		Website website = null;
		if (NullUtils.isNotEmpty(mod.getListtmp())) {
			website = this.websiteDao.getWebsite(mod.getListtmp());
		}
		if (website == null) {
			website = this.websiteDao.getWebsite(ElementConst.Default_ListTmp);
		}
		model.put("sys_pageIndex", page);
		model.put("sys_classifyName", cls.getName());
		model.put("sys_classify", classify);
		model.put("model", ElementConst.Default_ListDir + website.getPath());
		
		model.put("sys_basePath", ElementConst.Default_SourceList 
				+ website.getPath().substring(0, website.getPath().indexOf("/")));
		return model;
	}
	
	@Transactional(readOnly = true)
	public Map<String, Object> detail(String imagemes, String userid, String wx, String wxMarkcode, Integer tag, String title) {
		Map<String, Object> model = new HashMap<String, Object>();
		Wx weixin = null;
		if(NullUtils.isEmpty(wx)) {
			weixin = this.wxDao.getWxByMarkcode(wxMarkcode);
		}else {
			weixin = this.wxDao.getWx(wx);
		}
		
		Model mod = this.modelDao.getModelCache(weixin.getId());
		Website website = null;
		if (NullUtils.isNotEmpty(mod.getDetailtmp())) {
			website = this.websiteDao.getWebsite(mod.getDetailtmp());
		}
		if (website == null) {
			website = this.websiteDao.getWebsite(ElementConst.Default_DetailTmp);
		}
		model.put("sys_imagemes", imagemes);
		model.put("sys_userid", userid);
		model.put("sys_title", title);
		model.put("sys_tag", tag);
		model.put("model", ElementConst.Default_DetailDir + website.getPath());
		model.put("sys_basePath", ElementConst.Default_SourceDetail 
				+ website.getPath().substring(0, website.getPath().indexOf("/")));
		return model;
	}
	
	@Transactional(readOnly = true)
	public String sendTemplateMsg(String wxMarkcode, String touser, String template_id,
			String url, String first, String remark, String keyword1, String keyword2, String keyword3, String keyword4, String keyword5) {
		
		Wx wx = this.wxDao.getWxByMarkcode(wxMarkcode);
		if(wx == null) return JsonUtil.toResOfFail("发送失败，公众号参数不正确");
		
		GovFirst govfirst = new GovFirst(first, "#173177");
		Keyword word1 = new Keyword(keyword1, "#173177");
		Keyword word2 = new Keyword(keyword2, "#173177");
		Keyword word3 = new Keyword(keyword3, "#173177");
		Keyword word4 = new Keyword(keyword4, "#173177");
		Keyword word5 = new Keyword(keyword5, "#173177");
		Remark govremark = new Remark(remark, "#173177");
		GovData data = new GovData(govfirst, word1, word2, word3, word4, word5, govremark);
		GovTemplate template = new GovTemplate(touser, template_id, url, data);
		AccessToken at = WeixinCacheUtil.getAccessToken(wx.getId(), wx.getAppId(), wx.getAppSecret());
		int result = WeixinUtil.senTemplate(template, at.getToken());
		if(result > 0) return JsonUtil.toResOfFail("发送失败");
		return JsonUtil.toRes("发送成功");
	}
	
	@Transactional(readOnly = true)
	public Map<String, Object> document(String businessCode, String id) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("sys_id", id);
		model.put("sys_businessCode", businessCode);
		
		if(businessCode.equals("DKS652")) {//通告
			model.put("model", "front/document/annunciate");
		}else if(businessCode.equals("DKS653")){//警告
			model.put("model", "front/document/warning");
		}
		return model;
	}

}



