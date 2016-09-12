package com.xysoft.admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.xysoft.admin.service.WxService;
import com.xysoft.dao.AttentionDao;
import com.xysoft.dao.AuthorityDao;
import com.xysoft.dao.ClassifyDao;
import com.xysoft.dao.DiymenDao;
import com.xysoft.dao.HomeDao;
import com.xysoft.dao.ImageMesDao;
import com.xysoft.dao.ModelDao;
import com.xysoft.dao.TextMesDao;
import com.xysoft.dao.WxDao;
import com.xysoft.dao.WxUserDao;
import com.xysoft.dao.WxUserGroupDao;
import com.xysoft.entity.Attention;
import com.xysoft.entity.Authority;
import com.xysoft.entity.Classify;
import com.xysoft.entity.Diymen;
import com.xysoft.entity.Home;
import com.xysoft.entity.ImageMes;
import com.xysoft.entity.Model;
import com.xysoft.entity.TextMes;
import com.xysoft.entity.Wx;
import com.xysoft.entity.WxUser;
import com.xysoft.entity.WxUserGroup;
import com.xysoft.util.JsonUtil;
import com.xysoft.util.NullUtils;
import com.xysoft.util.RequestUtil;

@SuppressWarnings("unchecked")
@Component
public class WxServiceImpl implements WxService {
	@Resource
	private WxDao wxDao;
	@Resource
	private AuthorityDao authorityDao;
	@Resource
	private HomeDao homeDao;
	@Resource
	private ModelDao modelDao;
	@Resource
	private AttentionDao attentionDao;
	@Resource
	private ClassifyDao classifyDao;
	@Resource
	private DiymenDao diymenDao;
	@Resource
	private ImageMesDao imageMesDao;
	@Resource
	private TextMesDao textMesDao;
	@Resource
	private WxUserGroupDao wxUserGroupDao;
	@Resource
	private WxUserDao wxUserDao;

	@Transactional(readOnly = true)
	public String getWxs() {
		List<Wx> wxs = this.wxDao.getWxs();
		return JsonUtil.toString(wxs);
	}

	@Transactional(readOnly = true)
	public String getAuthorityByWx(String wxid) {
		List<Authority> authoritys = this.authorityDao.getAuthoritys();
		Map<String, List<Authority>> maps = new HashMap<String, List<Authority>>();
		for (Authority authority : authoritys) {
			List<Authority> hms = null;
			if (maps.containsKey(authority.getParentId())) {
				hms = maps.get(authority.getParentId());
			} else {
				hms = new ArrayList<Authority>();
			}
			hms.add(authority);
			maps.put(authority.getParentId(), hms);
		}
		List<Authority> hms = new ArrayList<Authority>(); 
		for (Authority authority : authoritys) {
			if (NullUtils.isEmpty(authority.getParentId())) {
				Authority hm = rebuildAuthority(hms, maps, authority);
				if (hm.getChildren().size() == 0) continue;
				hms.add(hm);
			}
		}
		
		RequestUtil.setWeiXinId(wxid);
		
		return JsonUtil.toString(hms);
	}
	
	/**
	 * 递归查找子分类节点.
	 */
	private Authority rebuildAuthority(List<Authority> hms, Map<String, List<Authority>> maps, Authority authority) {
		if (!maps.containsKey(authority.getId())) return authority;
		List<Authority> lst = maps.get(authority.getId()); 
		for (Authority ls : lst) {
			authority.getChildren().add(rebuildAuthority(hms, maps, ls));
		}
		return authority;
	}

	@Transactional
	public String saveWx(Wx param, Boolean flag) {
		Wx wx = null;
		if (!"".equals(param.getId())) {
			wx = this.wxDao.getWx(param.getId());
		} else {
			wx = new Wx();
		}
		
		long count = this.wxDao.countWxByMarkcode(param.getMarkcode());
		if (!param.getMarkcode().equals(wx.getMarkcode()) && count > 0) {
			return JsonUtil.toResOfFail("保存失败，公众号ID已存在");
		}
		
		wx.setEmail(param.getEmail());
		wx.setImg(param.getImg());
		wx.setMarkcode(param.getMarkcode());
		wx.setName(param.getName());
/*		if (flag) {
			wx.setEnabled(param.getEnabled());
		}*/
		wx.setEnabled(true);
		this.wxDao.saveWx(wx);
		if (NullUtils.isEmpty(param.getId())) {
			//初始化首页设置
			Home home = new Home();
			home.setWx(wx.getId()); 
			home.setName("首页");
			this.homeDao.saveHome(home);
			//初始化关注设置
			Attention attention = new Attention();
			attention.setContent("欢迎关注"+ wx.getName());
			attention.setIsmarkcode(false);
			attention.setWx(wx.getId());
			this.attentionDao.saveAttention(attention);
		}
		return JsonUtil.toRes("保存成功", wx.getId());
	}
	
	@Transactional
	public String deleteWx(String id) {
		Wx wx = this.wxDao.getWx(id);
		//删除首页设置
		Home home = this.homeDao.getHome(wx.getId());
		this.homeDao.deleteHome(home);
		//删除模板设置
		Model model = this.modelDao.getModel(wx.getId());
		if(model != null) {this.modelDao.deleteModel(model);}
		//删除关注回复
		Attention attention = this.attentionDao.getAttention(wx.getId());
		if (attention != null) {
			this.attentionDao.deleteAttention(attention);
		}
		//删除分类信息
		List<Classify> classifys = this.classifyDao.getClassifys(wx.getId());
		for (Classify classify : classifys) {
			this.classifyDao.deleteClassify(classify);
		}
		//删除自定义菜单
		List<Diymen> diymens = this.diymenDao.getDiymenes(wx.getId());
		for (Diymen diymen : diymens) {
			this.diymenDao.deleteDiymen(diymen);
		}
		//删除图文信息
		List<ImageMes> imageMess = this.imageMesDao.getImageMess(wx.getId());
		for (ImageMes imageMes : imageMess) {
			this.imageMesDao.deleteImageMes(imageMes);
		}
		//删除文本信息
		List<TextMes> textMess = this.textMesDao.getTextMessAll(wx.getId());
		for (TextMes textMes : textMess) {
			this.textMesDao.deleteTextMes(textMes);
		}
		//删除微信会员分组信息
		List<WxUserGroup> wxUserGroups = this.wxUserGroupDao.getWxUserGroups(wx.getId());
		for (WxUserGroup wxUserGroup : wxUserGroups) {
			this.wxUserGroupDao.deleteWxUserGroup(wxUserGroup);
		}
		//删除微信会员信息
		List<WxUser> wxUsers = this.wxUserDao.getWxUserByWx(wx.getId());
		for (WxUser wxUser : wxUsers) {
			this.wxUserDao.delete(wxUser);
		}
		//删除微信信息
		this.wxDao.deleteWx(wx);
		return JsonUtil.toRes("删除成功");
	}

}
