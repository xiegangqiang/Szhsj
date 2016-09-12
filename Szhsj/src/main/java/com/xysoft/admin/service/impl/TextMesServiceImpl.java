package com.xysoft.admin.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.xysoft.admin.service.TextMesService;
import com.xysoft.dao.TextMesDao;
import com.xysoft.entity.TextMes;
import com.xysoft.support.PageParam;
import com.xysoft.support.Pager;
import com.xysoft.util.JsonUtil;
import com.xysoft.util.RequestUtil;

@SuppressWarnings("unchecked")
@Component
public class TextMesServiceImpl implements TextMesService {
	@Resource
	private TextMesDao textMesDao;
	
	@Transactional(readOnly = true)
	public String getTextMess(PageParam page, String name) {
		Pager<TextMes> pager = this.textMesDao.getTextMess(page, name, RequestUtil.getWeiXinId());
		return JsonUtil.toStringFromObject(pager);
	}

	@Transactional
	public String saveTextMes(TextMes param) {
		TextMes textMes = null;
		if (!"".equals(param.getId())) {
			textMes = this.textMesDao.getTextMes(param.getId());
		} else {
			textMes = new TextMes();
			textMes.setWx(RequestUtil.getWeiXinId());
		}
		BeanUtils.copyProperties(param, textMes, new String[]{"id", "wx", "viewcount"});
		this.textMesDao.saveTextMes(textMes);
		return JsonUtil.toRes("保存成功");
	}

	@Transactional
	public String deleteTextMes(String id) {
		TextMes textMes = this.textMesDao.getTextMes(id);
		this.textMesDao.deleteTextMes(textMes);
		return JsonUtil.toRes("删除成功");
	}

}
