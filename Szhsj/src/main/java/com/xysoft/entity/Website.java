package com.xysoft.entity;

import javax.persistence.Entity;

@Entity
public class Website extends BaseEntity {
	
	private static final long serialVersionUID = -907863512606479866L;

	private String name; //模版名称
	
	private String img; //模版图片
	
	private String backimg; //默认背景图片
	
	private Integer type; //1为首页模版、2为列表模版、3为详细页模版、4为商城模板
	
	private Integer level; //等级排序
	
	private String path; //模版路径
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public String getBackimg() {
		return backimg;
	}

	public void setBackimg(String backimg) {
		this.backimg = backimg;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
}
