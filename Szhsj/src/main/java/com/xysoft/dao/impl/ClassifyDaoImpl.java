package com.xysoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xysoft.dao.ClassifyDao;
import com.xysoft.entity.Classify;
import com.xysoft.support.BaseDaoImpl;
import com.xysoft.support.PageParam;
import com.xysoft.support.Pager;

@Component
public class ClassifyDaoImpl extends BaseDaoImpl<Classify> implements ClassifyDao {

	public Pager<Classify> getClassifys(PageParam page, String name, String wxid) {
		return this.getForPager("from Classify where wx = ? and name like ? order by level asc, id asc", 
				page, wxid, "%" + name + "%");
	}
	
	public Classify getClassify(String id) {
		return this.get(Classify.class, id);
	}

	public void saveClassify(Classify classify) {
		this.save(classify);
	}

	public void deleteClassify(Classify classify) {
		this.delete(classify);
	}

	public List<Classify> getClassifyByMarkcode(String wxid, String markcode) {
		return this.find("from Classify where wx = ? and markcode = ? order by level desc, id asc", wxid, markcode);
	}
	
	public Classify getClassifyCache(String id) {
		return this.get(Classify.class, id);
	}
	
	public List<Classify> getClassifys(String wxid) {
		return this.find("from Classify where wx = ? order by level desc, id asc", wxid);
	}

	public List<Classify> getClassifys(String wxid, Boolean visible) {
		return this.find("from Classify where wx = ? and visible = ? order by level desc, id asc", wxid, visible);
	}
	
}
