package com.sam.entity;

import java.io.Serializable;

public class Cart implements Serializable{
	
	private Integer id;
	private String user_loginname;
	private String book_uuid;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser_loginname() {
		return user_loginname;
	}
	public void setUser_loginname(String user_loginname) {
		this.user_loginname = user_loginname;
	}
	public String getBook_uuid() {
		return book_uuid;
	}
	public void setBook_uuid(String book_uuid) {
		this.book_uuid = book_uuid;
	}
	
	@Override
	public String toString() {
		return "Cart [id=" + id + ", user_loginname=" + user_loginname + ", book_uuid=" + book_uuid + "]";
	}
	

}
