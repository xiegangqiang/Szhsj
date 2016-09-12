package com.xysoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xysoft.dao.WebsiteDao;
import com.xysoft.entity.Website;
import com.xysoft.support.BaseDaoImpl;

@Component
public class WebsiteDaoImpl extends BaseDaoImpl<Website> implements WebsiteDao {

	public List<Website> getWebsites() {
		return this.find("from Website where type > 0 order by level asc, id asc");
	}

	public Website getWebsite(String id) {
		return this.get(Website.class, id);
	}

}
