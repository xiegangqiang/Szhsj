package com.xysoft.admin.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.xysoft.admin.service.PlugMenuService;
import com.xysoft.common.ElementConst;
import com.xysoft.dao.PlugMenuDao;
import com.xysoft.entity.PlugMenu;
import com.xysoft.support.PageParam;
import com.xysoft.support.Pager;
import com.xysoft.util.JsonUtil;
import com.xysoft.util.RequestUtil;

@SuppressWarnings("unchecked")
@Component
public class PlugMenuServiceImpl implements PlugMenuService {
	@Resource
	private PlugMenuDao plugMenuDao;
	
	@Transactional
	public String getPlugMenus(PageParam page, String name, String wx) {
		Pager<PlugMenu> pager = null;
		List<PlugMenu> plugMenus = this.plugMenuDao.getPlugMenus(RequestUtil.getWeiXinId());
		if(plugMenus.size()==0){
			for (int i = 0; i < ElementConst.Defalut_Plug_Menu.length; i++) {
				String menu = ElementConst.Defalut_Plug_Menu[i];
				String logo = ElementConst.Defalut_Plug_Menu_Logo[i];
				PlugMenu plm = new PlugMenu();
				plm.setName(menu);
				plm.setLogo(logo);
				plm.setWx(RequestUtil.getWeiXinId());
				plm.setVisible(false);
				this.plugMenuDao.saveOrUpdate(plm);
			}
			pager = this.plugMenuDao.getPlugMenus(page, name, RequestUtil.getWeiXinId());
		}
		else{
			 pager = this.plugMenuDao.getPlugMenus(page, name, RequestUtil.getWeiXinId());
		}
		return JsonUtil.toStringFromObject(pager);
	}
	
	@Transactional
	public String savePlugMenu(PlugMenu param) {
		PlugMenu plugMenu = null;
		if (!"".equals(param.getId())) {
			plugMenu = this.plugMenuDao.getPlugMenu(param.getId());
		} else {
			plugMenu = new PlugMenu();
			plugMenu.setWx(RequestUtil.getWeiXinId());
		}
		BeanUtils.copyProperties(param, plugMenu, new String[]{"id", "wx", "logo", "createDate"});
		this.plugMenuDao.savePlugMenu(plugMenu);
		return JsonUtil.toRes("保存成功");
	}
	
}
