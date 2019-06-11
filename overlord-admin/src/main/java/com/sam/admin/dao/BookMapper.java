package com.sam.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sam.admin.entity.Book;

public interface BookMapper {
	
	Book selectBookById(Integer id);
	Book selectBookByUuid(String uuid);
	List<Book> selectBookNameLike(Book book);
	List<Book> selectBookAll();
	Book selectBookSortByBookuuid(String uuid);
	
	List<Book> selectBookBySort_1(@Param(value="sort_1") String sort_1);
	List<Book> selectBookBySort_0(@Param(value="sort_0") String sort_0);
	
	//按多重条件条件查找book
	List<Book> selectBookByConditions(@Param(value="name") String name,@Param(value="uuid") String uuid,
			@Param(value="sort_0") String sort_0,@Param(value="sort_1") String sort_1,
			@Param(value="status") String status,@Param(value="owner_name") String owner_name);
	
	int updateStatusByUuid(@Param(value="uuid") String uuid,@Param(value="status") String status);
	int delBookByUuid(@Param(value="uuid") String uuid);
	
	int insertBook(Book book);
	
	int setBookCountByUuid(@Param(value="count") Integer count,@Param(value="uuid") String uuid);

}
