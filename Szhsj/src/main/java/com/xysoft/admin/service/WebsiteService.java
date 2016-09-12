package com.xysoft.admin.service;

public interface WebsiteService {
	
	/**
	 * 获取模版列表.
	 */
	public String getWebsites();

	/**
	 * 获取微信公众号模版信息.
	 */
	public String getModel();
	
	/**
	 * 设置微信公众号模版信息.
	 */
	public String saveModelInfo(String name, String val);
}
