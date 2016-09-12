package com.xysoft.dao;

import java.util.List;

import com.xysoft.entity.Menu;
import com.xysoft.support.BaseDao;

public interface MenuDao extends BaseDao<Menu> {
	
	/**
	 * 获取菜单列表.
	 */
	public List<Menu> getMenus();
	
	/**
	 * 获取权限菜单列表.
	 */
	public List<Menu> getMenusAction();
	
}
