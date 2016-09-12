package com.xysoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xysoft.dao.MenuDao;
import com.xysoft.entity.Menu;
import com.xysoft.support.BaseDaoImpl;

@Component
public class MenuDaoImpl extends BaseDaoImpl<Menu> implements MenuDao {

	public List<Menu> getMenus() {
		return this.find("from Menu where visible = true order by leaf asc, level asc");
	}

	public List<Menu> getMenusAction() {
		return this.find("from Menu where visible = true and leaf = 1 order by leaf asc");
	}
}
