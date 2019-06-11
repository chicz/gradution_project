package com.sam.entity;

public class Sort {

	private Integer id;
	private String sort_0;
	private String sort_1;
	private String number;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSort_0() {
		return sort_0;
	}
	public void setSort_0(String sort_0) {
		this.sort_0 = sort_0;
	}
	public String getSort_1() {
		return sort_1;
	}
	public void setSort_1(String sort_1) {
		this.sort_1 = sort_1;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "Sort [id=" + id + ", sort_0=" + sort_0 + ", sort_1=" + sort_1 + ", number=" + number + "]";
	}
	
}
