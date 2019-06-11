package com.sam.entity;

import java.io.Serializable;

public class Book implements Serializable {

	private Integer id;
	private String uuid;
	private String name;
	private double price;
	private Integer grade;
	private String remark;
	private Integer count;
	private Integer out_count;

	private String author;
	// 出版社
	private String press;
	private String version;
	private String pic_0;
	private String pic_1;
	private String pic_2;
	private String pic_3;
	private String pic_4;
	// 状态0：售罄，1：正常
	private String status;
	// 状态0：下架，1：正常
	private String del_flag;
	private String owner_name;

	// 查询商品的时候，也把商品的分类查询好
	private Sort sort;

	public Sort getSort() {
		return sort;
	}

	public void setSort(Sort sort) {
		this.sort = sort;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getOut_count() {
		return out_count;
	}

	public void setOut_count(Integer out_count) {
		this.out_count = out_count;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getPic_0() {
		return pic_0;
	}

	public void setPic_0(String pic_0) {
		this.pic_0 = pic_0;
	}

	public String getPic_1() {
		return pic_1;
	}

	public void setPic_1(String pic_1) {
		this.pic_1 = pic_1;
	}

	public String getPic_2() {
		return pic_2;
	}

	public void setPic_2(String pic_2) {
		this.pic_2 = pic_2;
	}

	public String getPic_3() {
		return pic_3;
	}

	public void setPic_3(String pic_3) {
		this.pic_3 = pic_3;
	}

	public String getPic_4() {
		return pic_4;
	}

	public void setPic_4(String pic_4) {
		this.pic_4 = pic_4;
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

	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", uuid=" + uuid + ", name=" + name + ", price=" + price + ", grade=" + grade
				+ ", remark=" + remark + ", count=" + count + ", out_count=" + out_count + ", author=" + author
				+ ", press=" + press + ", version=" + version + ", pic_0=" + pic_0 + ", pic_1=" + pic_1 + ", pic_2="
				+ pic_2 + ", pic_3=" + pic_3 + ", pic_4=" + pic_4 + ", status=" + status + ", del_flag=" + del_flag
				+ ", sort=" + sort + "]";
	}

}
