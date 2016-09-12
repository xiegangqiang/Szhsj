package com.xysoft.dao.impl;

import org.springframework.stereotype.Component;

import com.xysoft.dao.AttentionDao;
import com.xysoft.entity.Attention;
import com.xysoft.support.BaseDaoImpl;

@Component
public class AttentionDaoImpl extends BaseDaoImpl<Attention> implements AttentionDao {

	public Attention getAttention(String wxid) {
		return this.get("from Attention where wx = ?", wxid);
	}

	public void saveAttention(Attention attention) {
		this.save(attention);
	}

	public void deleteAttention(Attention attention) {
		this.delete(attention);
	}
	
	public Attention getAttentionByMarkcode(String wxid, String eventKey) {
		return this.get("from Attention where wx = ? and markcode=?", wxid, eventKey);
	}
}
