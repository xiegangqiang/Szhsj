package com.xysoft.admin.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.xysoft.admin.service.AttentionService;
import com.xysoft.dao.AttentionDao;
import com.xysoft.entity.Attention;
import com.xysoft.util.JsonUtil;
import com.xysoft.util.RequestUtil;

@SuppressWarnings("unchecked")
@Component
public class AttentionServiceImpl implements AttentionService {
	@Resource
	private AttentionDao attentionDao;
	
	@Transactional(readOnly = true)
	public String getAttention() {
		Attention attention = this.attentionDao.getAttention(RequestUtil.getWeiXinId());
		return JsonUtil.toStringFromObject(attention);
	}
	
	@Transactional
	public String saveAttention(Attention param) {
		Attention attention = this.attentionDao.getAttention(RequestUtil.getWeiXinId());
		if (attention == null) {
			attention = new Attention();
			attention.setWx(RequestUtil.getWeiXinId());
		}
		BeanUtils.copyProperties(param, attention, new String[]{"id", "wx"});
		this.attentionDao.saveAttention(attention);
		return JsonUtil.toRes("保存成功");
	}
	
}
