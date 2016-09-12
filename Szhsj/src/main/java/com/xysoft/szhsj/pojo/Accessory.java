package com.xysoft.szhsj.pojo;

import java.io.Serializable;

public class Accessory implements Serializable{

	private static final long serialVersionUID = 6966583260644463023L;

	private String accessoryid;
	private String fid;
	private String name;
	private Integer type;
	private String suffix;
	private String path;
	
	public String getAccessoryid() {
		return accessoryid;
	}
	public void setAccessoryid(String accessoryid) {
		this.accessoryid = accessoryid;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getSuffix() {
		return suffix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	

	
}
