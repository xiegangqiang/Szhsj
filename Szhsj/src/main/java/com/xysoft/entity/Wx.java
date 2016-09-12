package com.xysoft.entity;

import javax.persistence.Entity;

@Entity
public class Wx extends BaseEntity {
	
	private static final long serialVersionUID = -1984320921449803868L;
	
	private String name; //微信名称
	
	private String img; //二维码
	
	private String appId; //微信appId
	
	private String appSecret; //微信appSecret

	private Boolean enabled; //是否启用
	
	private String markcode; //微信原始ID
	
	private String email; //邮箱地址
	
	private String admin; //所属管理员

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

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getAppSecret() {
		return appSecret;
	}

	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getMarkcode() {
		return markcode;
	}

	public void setMarkcode(String markcode) {
		this.markcode = markcode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
