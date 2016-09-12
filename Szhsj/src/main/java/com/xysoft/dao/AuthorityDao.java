package com.xysoft.dao;

import java.util.List;

import com.xysoft.entity.Authority;
import com.xysoft.support.BaseDao;

public interface AuthorityDao extends BaseDao<Authority> {
	
	/**
	 * 获取微信菜单列表.
	 */
	public List<Authority> getAuthoritys();
	
	
}
