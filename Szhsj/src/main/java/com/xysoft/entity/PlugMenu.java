package com.xysoft.entity;

import javax.persistence.Entity;

@Entity
public class PlugMenu extends BaseEntity {
	
	private static final long serialVersionUID = -3512257969728593333L;
	
	private String name; //属性名称
	
	private Boolean visible; //是否显示
	
	private String value1; //属性值1
	
	private String value2; //属性值2
	
	private Integer level; //等级排序
	
	private String logo; //logo图片
	
	private String wx; //所属微信公众号

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getVisible() {
		return visible;
	}

	public void setVisible(Boolean visible) {
		this.visible = visible;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getWx() {
		return wx;
	}

	public void setWx(String wx) {
		this.wx = wx;
	}

	public String getValue1() {
		return value1;
	}

	public void setValue1(String value1) {
		this.value1 = value1;
	}

	public String getValue2() {
		return value2;
	}

	public void setValue2(String value2) {
		this.value2 = value2;
	}
}
