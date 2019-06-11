package com.sam.admin.entity;

public class BookSort {

	/*
	 * 商品分类的字典表 tb_book_sort 目前没有发现有任何的作用（是指这个bean，而不是指字典表）
	 * 在BookMapper.xml中通过两次的left join ... on就可以了
	 * 无需使用下列的：查询书本分类的时候，分类的详细名称也查询好
	 */
	private Integer id;
	private String sort_number;
	private String book_uuid;
	//查询书本分类的时候，分类的详细名称也查询好
	private Sort sort;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSort_number() {
		return sort_number;
	}
	public void setSort_number(String sort_number) {
		this.sort_number = sort_number;
	}
	public String getBook_uuid() {
		return book_uuid;
	}
	public void setBook_uuid(String book_uuid) {
		this.book_uuid = book_uuid;
	}
	public Sort getSort() {
		return sort;
	}
	public void setSort(Sort sort) {
		this.sort = sort;
	}
	@Override
	public String toString() {
		return "BookSort [id=" + id + ", sort_number=" + sort_number + ", book_uuid=" + book_uuid + ", sort=" + sort
				+ "]";
	}
	
}
