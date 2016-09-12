package com.xysoft.tag.param;

import java.util.Map;

public class ImageMesParam {
	private String imagemes;
	private Integer tag;
	
	public ImageMesParam(Map<String, Object> map) {
		if (map.containsKey("imagemes")) {
			try {
				imagemes = map.get("imagemes").toString();
			} catch (Exception e) {
				imagemes = "";
			}
		} else imagemes = "";
		
		if (map.containsKey("tag")) {
			try {
				tag = Integer.valueOf(map.get("tag").toString());
			} catch (Exception e) {
				tag = null;
			}
		} else tag = null;
	}

	public String getImagemes() {
		return imagemes;
	}

	public void setImagemes(String imagemes) {
		this.imagemes = imagemes;
	}

	public Integer getTag() {
		return tag;
	}

	public void setTag(Integer tag) {
		this.tag = tag;
	}
	
}
