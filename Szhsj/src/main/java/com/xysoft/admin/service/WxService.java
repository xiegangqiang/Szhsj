package com.xysoft.admin.service;

import com.xysoft.entity.Wx;

public interface WxService {
	
	/**
	 * 获取微信公众号列表.
	 */
	public String getWxs();
	
	/**
	 * 获取微信公众号相应的权限.
	 */
	public String getAuthorityByWx(String wxid);
	
	/**
	 * 保存微信公众号信息.
	 */
	public String saveWx(Wx param, Boolean flag);
	
	/**
	 * 删除微信公众号信息.
	 */
	public String deleteWx(String id);
	
}
