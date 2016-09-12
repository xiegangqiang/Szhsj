package com.xysoft.tag.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.xysoft.dao.SzhsjDao;
import com.xysoft.szhsj.pojo.Accessory;
import com.xysoft.tag.service.AccessoryTagService;
import com.xysoft.util.NullUtils;

@Component
public class AccessoryTagServiceImpl implements AccessoryTagService{
	
	@Resource
	private SzhsjDao szhsjDao;

	@Transactional(readOnly = true)
	public List<Accessory> getFiles(String imagemes) {
		List<Accessory> accessorys = null;
		if(NullUtils.isNotEmpty(imagemes)){
			accessorys = this.szhsjDao.getAccessorys(imagemes);
			for (Accessory accessory : accessorys) {
				if( accessory.getType() == 10) {
					for (Accessory aory : accessorys) {
						aory.setType(10);
					}
				}
			}
		}
		return accessorys;
	}

}
