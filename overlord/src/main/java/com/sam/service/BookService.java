package com.sam.service;

import java.util.List;

import com.sam.entity.Book;
import com.sam.entity.Sort;

public interface BookService {

	Book selectBookByUuid(String uuid);
	List<Book> selectBookNameLike(Book book);
	List<Book> selectBookAll();
	
	Book selectBookSortByBookuuid(String uuid);
	
}
