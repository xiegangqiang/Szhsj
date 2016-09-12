package com.xysoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xysoft.dao.ImageMesDao;
import com.xysoft.entity.ImageMes;
import com.xysoft.support.BaseDaoImpl;
import com.xysoft.support.PageParam;
import com.xysoft.support.Pager;

@Component
public class ImageMesDaoImpl extends BaseDaoImpl<ImageMes> implements ImageMesDao {
	
	public Pager<ImageMes> getImageMess(PageParam page, String name, String wxid) {
		return this.getForPager("from ImageMes where wx = ? and name like ? order by level desc, id desc", page, wxid, "%" + name + "%");
	}

	public ImageMes getImageMes(String id) {
		return this.get(ImageMes.class, id);
	}
	
	public void saveImageMes(ImageMes imageMes) {
		this.saveOrUpdate(imageMes);
	}

	public void deleteImageMes(ImageMes imageMes) {
		this.delete(imageMes);
	}

	public Pager<ImageMes> getImageMess(String wxid, Integer count,
			String classify) {
		return this.getForPager("from ImageMes where wx = ? and classify = ? and visible = true order by level desc, id desc", 1 , count, wxid, classify);
	}

	public Pager<ImageMes> getImageMessByMarkcode(String wxid, Integer count,
			String markcode) {
		return this.getForPager("from ImageMes where wx = ? and markcode = ? and visible = true order by level desc, id desc", 1 , count, wxid, markcode);
	}

	public ImageMes getImageMesCache(String id) {
		return this.get(ImageMes.class, id);
	}

	public List<ImageMes> getImageMess(String wxid) {
		return this.find("from ImageMes where wx = ? ", wxid);
	}

	public Pager<ImageMes> getImageMess(String classify, Integer page, Integer count) {
		return this.getForPager("from ImageMes where classify = ? and visible = true order by level desc, id desc", page , count, classify);
	}
}
