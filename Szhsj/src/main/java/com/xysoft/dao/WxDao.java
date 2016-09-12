package com.xysoft.dao;

import java.util.List;

import com.xysoft.entity.Wx;
import com.xysoft.support.BaseDao;

public interface WxDao extends BaseDao<Wx> {
	
	public List<Wx> getWxs(String admin);
	
	public List<Wx> getWxs();
	
	public Wx getWx(String id);
	
	public void saveWx(Wx wx);
	
	public Wx getWxByMarkcode(String markcode);
	
	public Wx getWxCache(String id);
	
	public void deleteWx(Wx wx);
	
	public long countWxByMarkcode(String markcode);

	
}
