package com.xysoft.tag.param;

import java.util.Map;

public class DocumentParam {
	private String businessCode;
	private String id;
	
	public DocumentParam(Map<String, Object> map) {
		if (map.containsKey("businessCode")) {
			try {
				businessCode = map.get("businessCode").toString();
			} catch (Exception e) {
				businessCode = "";
			}
		} else businessCode = "";
		
		if (map.containsKey("id")) {
			try {
				id = map.get("id").toString();
			} catch (Exception e) {
				id = "";
			}
		} else id = "";
	}
	
	public String getBusinessCode() {
		return businessCode;
	}
	public void setBusinessCode(String businessCode) {
		this.businessCode = businessCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
