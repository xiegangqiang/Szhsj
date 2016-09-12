package com.xysoft.tag.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.xysoft.dao.ImageMesDao;
import com.xysoft.dao.SzhsjDao;
import com.xysoft.entity.ImageMes;
import com.xysoft.support.DataPager;
import com.xysoft.support.Pager;
import com.xysoft.tag.service.ImageMesTagService;
import com.xysoft.util.NullUtils;

@Component
public class ImageMesTagServiceImpl implements ImageMesTagService {
	@Resource
	private ImageMesDao imageMesDao;
	@Resource
	private SzhsjDao szhsjDao;
	
	@Transactional(readOnly = true)
	public DataPager<ImageMes> getImageMess(String classify, Integer page, Integer count) {
		Pager<ImageMes> imageMeses = this.imageMesDao.getImageMess(classify, page, count);
		for (ImageMes imageMes : imageMeses.getDatas()) {
			if (NullUtils.isEmpty(imageMes.getUrl())) {
				imageMes.setUrl("/detail.jhtml?imagemes=" + imageMes.getId());
			}
		}
		DataPager<ImageMes> pager = new DataPager<ImageMes>(imageMeses.getDatas(), imageMeses.getTotal(), count);
		return pager;
	}
	
	@Transactional(readOnly = true)
	public ImageMes getImageMes(String imageMes, Integer tag) {
		ImageMes imageMesy = null;
		if(tag == null) {
			imageMesy = this.imageMesDao.getImageMesCache(imageMes);
		} else {
			imageMesy = this.szhsjDao.getImageMes(tag, imageMes);
		}
		return imageMesy;
	}

}
