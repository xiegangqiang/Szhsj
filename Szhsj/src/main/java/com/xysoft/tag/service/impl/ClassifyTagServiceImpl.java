package com.xysoft.tag.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.xysoft.dao.ClassifyDao;
import com.xysoft.entity.Classify;
import com.xysoft.tag.service.ClassifyTagService;
import com.xysoft.util.NullUtils;

@Component
public class ClassifyTagServiceImpl implements ClassifyTagService {
	@Resource
	private ClassifyDao classifyDao;

	@Transactional(readOnly = true)
	public List<Classify> getClassifys(String wx) {
		List<Classify> classifys = this.classifyDao.getClassifys(wx, true);
		for (Classify classify : classifys) {
			if (NullUtils.isEmpty(classify.getUrl())) {
				classify.setUrl("/list.jhtml?classify=" + classify.getId());
			}
		}
		return classifys;
	}

}
