package com.sam.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sam.admin.dao.BookMapper;
import com.sam.admin.entity.Book;
import com.sam.admin.service.BookService;

@Service ("bookService")
public class BookServiceImpl implements BookService{

	@Autowired
	private BookMapper bookMapper;
	
	@Override
	public Book selectBookByUuid(String uuid) {
		// TODO Auto-generated method stub
		return bookMapper.selectBookByUuid(uuid);
	}

	@Override
	public List<Book> selectBookNameLike(Book book) {
		// TODO Auto-generated method stub
		return bookMapper.selectBookNameLike(book);
	}

	@Override
	public List<Book> selectBookAll() {
		// TODO Auto-generated method stub
		return bookMapper.selectBookAll();
	}
	
	@Override
	public Book selectBookSortByBookuuid(String uuid) {
		// TODO Auto-generated method stub
		return bookMapper.selectBookSortByBookuuid(uuid);
	}

}
