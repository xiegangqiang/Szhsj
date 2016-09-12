package com.xysoft.dao.impl;

import org.springframework.stereotype.Component;

import com.xysoft.dao.ModelDao;
import com.xysoft.entity.Model;
import com.xysoft.support.BaseDaoImpl;

@Component
public class ModelDaoImpl extends BaseDaoImpl<Model> implements ModelDao {

	public Model getModel(String wxid) {
		return this.get("from Model where wx = ?", wxid);
	}

	public void saveModel(Model model) {
		this.save(model);
	}

	public void deleteModel(Model model) {
		this.delete(model);
	}
	
	public Model getModelCache(String wxid) {
		return this.get("from Model where wx = ?", wxid);
	}
}
