package com.sam.admin.service;

import java.util.List;

import com.sam.admin.entity.Book;

public interface BookService {

	Book selectBookByUuid(String uuid);
	List<Book> selectBookNameLike(Book book);
	List<Book> selectBookAll();
	
	Book selectBookSortByBookuuid(String uuid);
	
}
