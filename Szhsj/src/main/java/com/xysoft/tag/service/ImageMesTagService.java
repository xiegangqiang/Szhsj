package com.xysoft.tag.service;

import com.xysoft.entity.ImageMes;
import com.xysoft.support.DataPager;

public interface ImageMesTagService {
	
	/**
	 * 获取图文列表.
	 */
	public DataPager<ImageMes> getImageMess(String classify, Integer page, Integer count);
	
	/**
	 * 获取图文.
	 */
	public ImageMes getImageMes(String imagemes, Integer tag);
	
}
