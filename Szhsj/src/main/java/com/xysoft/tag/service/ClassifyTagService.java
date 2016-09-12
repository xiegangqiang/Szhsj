package com.xysoft.tag.service;

import java.util.List;

import com.xysoft.entity.Classify;

public interface ClassifyTagService {
	
	/**
	 * 获取所有的分类信息.
	 */
	public List<Classify> getClassifys(String wx);
}
