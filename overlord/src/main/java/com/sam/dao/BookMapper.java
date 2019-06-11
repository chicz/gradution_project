package com.sam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sam.entity.Book;

public interface BookMapper {
	
	Book selectBookById(Integer id);
	Book selectBookByUuid(String uuid);
	List<Book> selectBookNameLike(Book book);
	List<Book> selectBookAll();
	Book selectBookSortByBookuuid(String uuid);
	
	List<Book> selectBookBySort_1(@Param(value="sort_1") String sort_1);
	List<Book> selectBookBySort_0(@Param(value="sort_0") String sort_0);

}
