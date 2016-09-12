package com.xysoft.tag.param;

import java.util.Map;

public class ImageMesListParam {
	private String classify;
	private Integer page;
	private Integer count;
	
	public ImageMesListParam(Map<String, Object> map) {
		if (map.containsKey("classify")) {
			try {
				classify = map.get("classify").toString();
			} catch (Exception e) {
				classify = "";
			}
		} else classify = "";
		
		
		if (map.containsKey("page")) {
			try {
				page = Integer.valueOf(map.get("page").toString());
			} catch (Exception e) {
				page = 1;
			}
		} else page = 1;
		
		if (map.containsKey("count")) {
			try {
				count = Integer.valueOf(map.get("count").toString());
			} catch (Exception e) {
				count = 1;
			}
		} else count = 1;
		
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}
