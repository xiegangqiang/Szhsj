package com.xysoft.entity;

import javax.persistence.Entity;

@Entity
public class Model extends BaseEntity {
	
	private static final long serialVersionUID = -6447250129815580047L;

	private String wx; //所属微信公众号
	
	private String hometmp; //栏目首页模版
	
	private String listtmp; //图文列表模版
	
	private String detailtmp; //详细页模版
	
	public String getWx() {
		return wx;
	}

	public void setWx(String wx) {
		this.wx = wx;
	}

	public String getHometmp() {
		return hometmp;
	}

	public void setHometmp(String hometmp) {
		this.hometmp = hometmp;
	}

	public String getListtmp() {
		return listtmp;
	}

	public void setListtmp(String listtmp) {
		this.listtmp = listtmp;
	}

	public String getDetailtmp() {
		return detailtmp;
	}

	public void setDetailtmp(String detailtmp) {
		this.detailtmp = detailtmp;
	}
}
