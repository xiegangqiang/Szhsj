package com.xysoft.szhsj.pojo;

import java.io.Serializable;

public class RespMsg implements Serializable{
	
	private static final long serialVersionUID = 2521744005539494698L;
	
	private String ID;
	private String infoColumnname;
	private String Title;
	private String Question;
	private String searchtype;
	private String Visitor;
	private String email;
	private String Response;
	private String Date;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getInfoColumnname() {
		return infoColumnname;
	}
	public void setInfoColumnname(String infoColumnname) {
		this.infoColumnname = infoColumnname;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getQuestion() {
		return Question;
	}
	public void setQuestion(String question) {
		Question = question;
	}
	public String getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	public String getVisitor() {
		return Visitor;
	}
	public void setVisitor(String visitor) {
		Visitor = visitor;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getResponse() {
		return Response;
	}
	public void setResponse(String response) {
		Response = response;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	
	
}
