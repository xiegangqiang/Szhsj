package com.xysoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xysoft.dao.DiymenDao;
import com.xysoft.entity.Diymen;
import com.xysoft.support.BaseDaoImpl;

@Component
public class DiymenDaoImpl extends BaseDaoImpl<Diymen> implements DiymenDao {

	public List<Diymen> getDiymenes(String wxid) {
		return this.find("from Diymen where wx = ? order by parentId asc, level desc, id asc", wxid);
	}
	
	public Diymen getDiymen(String id) {
		return this.get(Diymen.class, id);
	}
	
	public void saveDiymen(Diymen Diymen) {
		this.saveOrUpdate(Diymen);
	}

	public void deleteDiymen(Diymen Diymen) {
		this.delete(Diymen);
	}

	public List<Diymen> getDiymenNull(String wxid) {
		return this.find("from Diymen where parentId is null and wx = ? order by level desc, createDate asc", wxid);
	}

	public List<Diymen> getDiymenChildren(String parentId) {
		return this.find("from Diymen where parentId is ?", parentId);
	}
	
}
