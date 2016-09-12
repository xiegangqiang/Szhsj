package com.xysoft.dao.impl;

import org.springframework.stereotype.Component;

import com.xysoft.dao.ImageMesClassifyVDao;
import com.xysoft.view.ImageMesClassifyV;
import com.xysoft.support.BaseDaoImpl;
import com.xysoft.support.PageParam;
import com.xysoft.support.Pager;

@Component
public class ImageMesClassifyVDaoImpl extends BaseDaoImpl<ImageMesClassifyV> implements ImageMesClassifyVDao {
	
	public Pager<ImageMesClassifyV> getImageMesClassifyVs(PageParam page, String name, String wxid) {
		return this.getForPager("from ImageMesClassifyV where wx = ? and name like ? order by level desc, id desc", page, wxid, "%" + name + "%");
	}

}
