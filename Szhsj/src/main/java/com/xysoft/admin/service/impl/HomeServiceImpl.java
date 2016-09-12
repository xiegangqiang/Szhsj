package com.xysoft.admin.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.xysoft.admin.service.HomeService;
import com.xysoft.dao.HomeDao;
import com.xysoft.entity.Home;
import com.xysoft.util.JsonUtil;
import com.xysoft.util.RequestUtil;

@SuppressWarnings("unchecked")
@Component
public class HomeServiceImpl implements HomeService {
	@Resource
	private HomeDao homeDao;
	
	@Transactional(readOnly = true)
	public String getHome() {
		Home home = this.homeDao.getHome(RequestUtil.getWeiXinId());
		return JsonUtil.toStringFromObject(home);
	}
	
	@Transactional
	public String saveHome(Home param) {
		Home home = this.homeDao.getHome(RequestUtil.getWeiXinId());
		if (home == null) {
			home = new Home();
			home.setWx(RequestUtil.getWeiXinId());
		}
		BeanUtils.copyProperties(param, home, new String[]{"id", "wx"});
		this.homeDao.saveHome(home);
		return JsonUtil.toRes("保存成功");
	}
	
}
