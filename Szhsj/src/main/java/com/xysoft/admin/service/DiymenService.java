package com.xysoft.admin.service;

import com.xysoft.entity.Diymen;
import com.xysoft.entity.Wx;


public interface DiymenService {
	
	/**
	 * 获取菜单列表.
	 */
	public String getDiymenes();
	
	/**
	 * 获取菜单列表(父节点).
	 */
	public String getDiymenesNull();
	
	/**
	 * 保存菜单信息.
	 */
	public String saveDiymen(Diymen param);
	
	/**
	 * 删除菜单信息.
	 */
	public String deleteDiymen(String id);
	
	/**
	 * 获取微信公众号信息.
	 */
	public String getWx();
	
	/**
	 * 设置微信公众号授权信息.
	 */
	public String configWx(Wx param);
	
	/**
	 * 生成微信公众号自定义菜单.
	 */
	public String createMenu();
}
