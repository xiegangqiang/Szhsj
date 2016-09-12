package com.xysoft.admin.service;

import com.xysoft.support.PageParam;

public interface ShopOrderDetailService {

	/**
	 * 获取商品列表
	 */
	public String getShopOrderDetails(PageParam page, String shopOrder);

}
