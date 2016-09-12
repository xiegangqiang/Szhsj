package com.xysoft.dao;

import com.xysoft.entity.Home;
import com.xysoft.support.BaseDao;

public interface HomeDao extends BaseDao<Home> {
	
	/**
	 * 获取首页信息.
	 */
	public Home getHome(String wxid);
	
	/**
	 * 保存首页信息.
	 */
	public void saveHome(Home home);
	
	/**
	 * 删除首页信息.
	 */
	public void deleteHome(Home home);
	
}
