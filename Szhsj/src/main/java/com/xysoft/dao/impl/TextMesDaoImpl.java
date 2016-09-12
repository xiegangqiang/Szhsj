package com.xysoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xysoft.dao.TextMesDao;
import com.xysoft.entity.TextMes;
import com.xysoft.support.BaseDaoImpl;
import com.xysoft.support.PageParam;
import com.xysoft.support.Pager;

@Component
public class TextMesDaoImpl extends BaseDaoImpl<TextMes> implements TextMesDao {
	
	public Pager<TextMes> getTextMess(PageParam page, String name, String wxid) {
		return this.getForPager("from TextMes where wx = ? and name like ? order by id desc", page, wxid, "%" + name + "%");
	}

	public TextMes getTextMes(String id) {
		return this.get(TextMes.class, id);
	}
	
	public void saveTextMes(TextMes imageMes) {
		this.saveOrUpdate(imageMes);
	}

	public void deleteTextMes(TextMes imageMes) {
		this.delete(imageMes);
	}

	public List<TextMes> getTextMess(String wxid, String markcode) {
		return this.find("from TextMes where wx = ? and visible = true and markcode = ? order by id desc", wxid, markcode);
	}

	public List<TextMes> getTextMessAll(String wxid) {
		return this.find("from TextMes where wx = ?", wxid);
	}

}
