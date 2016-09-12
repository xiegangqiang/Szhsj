package com.xysoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xysoft.dao.PlugMenuDao;
import com.xysoft.entity.PlugMenu;
import com.xysoft.support.BaseDaoImpl;
import com.xysoft.support.PageParam;
import com.xysoft.support.Pager;

@Component
public class PlugMenuDaoImpl extends BaseDaoImpl<PlugMenu> implements PlugMenuDao {

	public Pager<PlugMenu> getPlugMenus(PageParam page, String name, String wxid) {
		return this.getForPager("from PlugMenu where wx = ? and name like ? order by level desc, id asc", 
				page, wxid, "%" + name + "%");
	}
	
	public PlugMenu getPlugMenu(String id) {
		return this.get(PlugMenu.class, id);
	}

	public void savePlugMenu(PlugMenu plugMenu) {
		this.save(plugMenu);
	}

	public void deletePlugMenu(PlugMenu plugMenu) {
		this.delete(plugMenu);
	}
	
	public List<PlugMenu> getPlugMenus(String wxid) {
		return this.find("from PlugMenu where wx = ? order by level desc, id desc", wxid);
	}

	public List<PlugMenu> getPlugMenus(String wxid, Boolean visible) {
		return this.find("from PlugMenu where wx = ? and visible = ? order by level desc, id desc", wxid, visible);
	}
}
