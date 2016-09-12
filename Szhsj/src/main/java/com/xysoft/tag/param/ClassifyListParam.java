package com.xysoft.tag.param;

import java.util.Map;

public class ClassifyListParam {
	private String wx;
	
	public ClassifyListParam(Map<String, Object> map) {
		if (map.containsKey("wx")) {
			try {
				wx = map.get("wx").toString();
			} catch (Exception e) {
				wx = "";
			}
		} else wx = "";
	}

	public String getWx() {
		return wx;
	}

	public void setWx(String wx) {
		this.wx = wx;
	}

}
