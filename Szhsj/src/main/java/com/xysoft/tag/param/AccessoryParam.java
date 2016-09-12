package com.xysoft.tag.param;

import java.util.Map;

public class AccessoryParam {

	private String imagemes;
	
	public AccessoryParam(Map<String, Object> map) {
		if (map.containsKey("imagemes")) {
			try {
				imagemes = map.get("imagemes").toString();
			} catch (Exception e) {
				imagemes = "";
			}
		} else imagemes = "";
	}

	public String getImagemes() {
		return imagemes;
	}

	public void setImagemes(String imagemes) {
		this.imagemes = imagemes;
	}
	
	
}
