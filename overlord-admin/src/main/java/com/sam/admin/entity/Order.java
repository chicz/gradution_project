package com.sam.admin.entity;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String order_number;
	private String book_uuid;
	private String book_name;
	private double book_oneprice;
	private Integer book_count;
	private double book_totalprice;
	private String buyer_loginname;
	private String buyer_phone;
	private String seller_name;
	private String seller_phone;
	private Date maketime;
	private String status;
	private String del_flag;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrder_number() {
		return order_number;
	}

	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}

	public String getBook_uuid() {
		return book_uuid;
	}

	public void setBook_uuid(String book_uuid) {
		this.book_uuid = book_uuid;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public double getBook_oneprice() {
		return book_oneprice;
	}

	public void setBook_oneprice(double book_oneprice) {
		this.book_oneprice = book_oneprice;
	}

	public Integer getBook_count() {
		return book_count;
	}

	public void setBook_count(Integer book_count) {
		this.book_count = book_count;
	}

	public double getBook_totalprice() {
		return book_totalprice;
	}

	public void setBook_totalprice(double book_totalprice) {
		this.book_totalprice = book_totalprice;
	}

	public String getBuyer_loginname() {
		return buyer_loginname;
	}

	public void setBuyer_loginname(String buyer_loginname) {
		this.buyer_loginname = buyer_loginname;
	}

	public String getBuyer_phone() {
		return buyer_phone;
	}

	public void setBuyer_phone(String buyer_phone) {
		this.buyer_phone = buyer_phone;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public String getSeller_phone() {
		return seller_phone;
	}

	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}

	public Date getMaketime() {
		return maketime;
	}

	public void setMaketime(Date maketime) {
		this.maketime = maketime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", order_number=" + order_number + ", book_uuid=" + book_uuid + ", book_name="
				+ book_name + ", book_oneprice=" + book_oneprice + ", book_count=" + book_count + ", book_totalprice="
				+ book_totalprice + ", buyer_loginname=" + buyer_loginname + ", buyer_phone=" + buyer_phone
				+ ", seller_name=" + seller_name + ", seller_phone=" + seller_phone + ", maketime=" + maketime
				+ ", status=" + status + ", del_flag=" + del_flag + "]";
	}

}
