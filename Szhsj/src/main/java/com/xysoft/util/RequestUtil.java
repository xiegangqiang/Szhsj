package com.xysoft.util;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.xysoft.common.ElementConst;

/**
 * request工具类.
 */
public class RequestUtil {
	
	
	public static Map<String, Object> initFrontMap(Map<String, Object> map) {
		map.put("sys_http", ElementConst.Service_Address);
		return map;
	}
	
	/**
	 * 记录微信号ID
	 */
	public static void setWeiXinId(String id) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().setAttribute("WEIXIN_ID", id);
	}
	
	/**
	 * 获取微信号ID
	 */
	public static String getWeiXinId() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request.getSession().getAttribute("WEIXIN_ID").toString();
	}
	
}
