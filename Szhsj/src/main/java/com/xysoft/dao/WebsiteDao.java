package com.xysoft.dao;

import java.util.List;

import com.xysoft.entity.Website;
import com.xysoft.support.BaseDao;

public interface WebsiteDao extends BaseDao<Website> {
	
	/**
	 * 获取模版列表信息.
	 */
	public List<Website> getWebsites();
	
	/**
	 * 获取模版信息.
	 */
	public Website getWebsite(String id);
	
}
