package com.xysoft.dao;

import java.util.List;

import com.xysoft.entity.PlugMenu;
import com.xysoft.support.BaseDao;
import com.xysoft.support.PageParam;
import com.xysoft.support.Pager;

public interface PlugMenuDao extends BaseDao<PlugMenu> {
	
	/**
	 * 获取版权列表.
	 */
	public Pager<PlugMenu> getPlugMenus(PageParam page, String name, String wxid);
	
	/**
	 * 获取版权信息.
	 */
	public PlugMenu getPlugMenu(String id);
	
	/**
	 * 保存版权信息.
	 */
	public void savePlugMenu(PlugMenu plugMenu);
	
	/**
	 * 删除版权信息.
	 */
	public void deletePlugMenu(PlugMenu plugMenu);
	
	/**
	 * 获取所有的幻灯片信息.
	 */
	public List<PlugMenu> getPlugMenus(String wxid);
	
	/**
	 * 获取所有幻灯片信息.
	 */
	public List<PlugMenu> getPlugMenus(String wxid, Boolean visible);
	
}
