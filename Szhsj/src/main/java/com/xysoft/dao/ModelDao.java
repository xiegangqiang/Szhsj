package com.xysoft.dao;

import com.xysoft.entity.Model;
import com.xysoft.support.BaseDao;

public interface ModelDao extends BaseDao<Model> {
	
	/**
	 * 获取微信公众号模版信息.
	 */
	public Model getModel(String wxid);
	
	/**
	 * 保存微信公众号模版信息.
	 */
	public void saveModel(Model model);
	
	/**
	 * 删除微信公众号模版信息.
	 */
	public void deleteModel(Model model);
	
	/**
	 * 获取微信公众号模版信息.
	 */
	public Model getModelCache(String wxid);
	
}
