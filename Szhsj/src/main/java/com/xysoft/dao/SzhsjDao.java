package com.xysoft.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xysoft.entity.ImageMes;
import com.xysoft.szhsj.pojo.Accessory;
import com.xysoft.szhsj.pojo.RespMsg;
@Component
public interface SzhsjDao {
	
	List<RespMsg> getQueryList (String eventKey, Integer  size);
	
	ImageMes getImageMes(Integer tag, String id);
	
	List<Accessory> getAccessorys(String fid);
	
}
