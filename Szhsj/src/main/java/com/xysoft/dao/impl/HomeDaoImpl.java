package com.xysoft.dao.impl;

import org.springframework.stereotype.Component;

import com.xysoft.dao.HomeDao;
import com.xysoft.entity.Home;
import com.xysoft.support.BaseDaoImpl;

@Component
public class HomeDaoImpl extends BaseDaoImpl<Home> implements HomeDao {

	public Home getHome(String wxid) {
		return this.get("from Home where wx = ?", wxid);
	}

	public void saveHome(Home home) {
		this.save(home);
	}

	public void deleteHome(Home home) {
		this.delete(home);
	}
}
