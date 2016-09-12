package com.xysoft.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.xysoft.admin.service.WebsiteService;
import com.xysoft.dao.ModelDao;
import com.xysoft.dao.WebsiteDao;
import com.xysoft.entity.Model;
import com.xysoft.entity.Website;
import com.xysoft.util.JsonUtil;
import com.xysoft.util.RequestUtil;

@SuppressWarnings("unchecked")
@Component
public class WebsiteServiceImpl implements WebsiteService {
	@Resource
	private WebsiteDao websiteDao;
	@Resource
	private ModelDao modelDao;
	
	@Transactional(readOnly = true)
	public String getWebsites() {
		List<Website> websites = this.websiteDao.getWebsites();
		return JsonUtil.toString(websites);
	}

	@Transactional(readOnly = true)
	public String getModel() {
		Model model = this.modelDao.getModel(RequestUtil.getWeiXinId());
		return JsonUtil.toStringFromObject(model);
	}

	@Transactional
	public String saveModelInfo(String name, String val) {
		Model model = this.modelDao.getModel(RequestUtil.getWeiXinId());
		if (model == null) {
			model = new Model();
			model.setWx(RequestUtil.getWeiXinId());
		}
		try {
			BeanUtils.setProperty(model, name, val);
			this.modelDao.saveModel(model);
			return JsonUtil.toRes("保存成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.toResOfFail("保存失败");
	}
	
}
