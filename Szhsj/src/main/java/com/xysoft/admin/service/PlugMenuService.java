package com.xysoft.admin.service;

import com.xysoft.entity.PlugMenu;
import com.xysoft.support.PageParam;

public interface PlugMenuService {
	
	/**
	 * 获取版权列表.
	 */
	public String getPlugMenus(PageParam page, String name, String wx);
	
	/**
	 * 保存版权信息.
	 */
	public String savePlugMenu(PlugMenu param);
	
}
