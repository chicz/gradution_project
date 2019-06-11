package com.sam.book.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sam.dao.BookMapper;
import com.sam.entity.Book;
import com.sam.entity.User;
import com.sam.service.BookService;

/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring/applicationContext.xml"})*/
public class BookSearchTest {
	
    @Autowired
	private BookMapper bookMapper;
    
    @Autowired
    @Qualifier("bookService")
    private BookService bookService;
	
	/*@Test*/
	public void test() {
		//测试商品表--分类表--分类字典表
		//Book book = bookMapper.selectBookSortByBookuuid("d743d3");
		//System.out.println(book);
		//测试利用sort_1查询book
		List<Book> books = bookMapper.selectBookBySort_0("哲学");
		if(books.isEmpty()) {
			System.out.println("没有此类图书");
		}
		System.out.println(books);
		for(Book book : books) {
			System.out.println(">>"+book);
		}
		/*String uuid = "a4d59f";
		String name = "android";
		Book book = bookMapper.selectBookByUuid(uuid);
		System.out.println(book);
		Book book2 = bookService.selectBookByUuid(uuid);
		System.out.println("selectBookByUuid:"+book2);
		
		List<Book> books2 = bookService.selectBookAll();
		for(Book book3 : books2) {
			System.out.println("selectBookAll:"+book3);
		}
		
		System.out.println("从入门："+name);
		Book book3 = new Book();
		book3.setName(name);
		List<Book> books = bookService.selectBookNameLike(book3);
		System.out.println("selectBookNameLike_all:"+books);
		for(Book book4 : books) {
			System.out.println("selectBookNameLike:"+book4);
		}*/
		
	}

}
