package com.xysoft.front.service;

import java.util.Map;

public interface FrontService {
	
	/**
	 * 测试索引.
	 */
	public Map<String, Object> test();
	
	/**
	 * 错误页面索引.
	 */
	public Map<String, Object> error();

	/**
	 * 首页索引.
	 */
	public Map<String, Object> index(String wx);
	
	/**
	 * 列表索引.
	 */
	public Map<String, Object> list(String classify, Integer page);
	
	/**
	 * 内容索引.
	 */
	public Map<String, Object> detail(String detail, String userid, String wx, String wxMarkcode, Integer tag, String title);
	
	/**
	 * 发送微信模板消息接口
	 */
	public String sendTemplateMsg(String wxMarkcode, String touser, String template_id,
			String url, String first, String remark, String keyword1, String keyword2, String keyword3, String keyword4, String keyword5);
	
	/**
	 * 航行公文索引（包括通告和警告）
	 */
	public Map<String, Object> document(String businessCode, String id);
	
}
