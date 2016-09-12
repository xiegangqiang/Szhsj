package com.xysoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xysoft.dao.WxDao;
import com.xysoft.entity.Wx;
import com.xysoft.support.BaseDaoImpl;

@Component
public class WxDaoImpl extends BaseDaoImpl<Wx> implements WxDao {

	public List<Wx> getWxs(String admin) {
		return this.find("from Wx where admin = ? order by createDate desc", admin);
	}
	
	public List<Wx> getWxs() {
		return this.find("from Wx order by createDate desc");
	}

	public Wx getWx(String id) {
		return this.get(Wx.class, id);
	}

	public void saveWx(Wx wx) {
		this.saveOrUpdate(wx);
	}

	public Wx getWxByMarkcode(String markcode) {
		return this.get("from Wx where enabled = true and markcode = ?", markcode);
	}
	
	public Wx getWxCache(String id) {
		return this.get(Wx.class, id);
	}

	public void deleteWx(Wx wx) {
		this.delete(wx);
	}

	public long countWxByMarkcode(String markcode) {
		return this.count("from Wx where markcode = ?", markcode);
	}
	
}
