package com.sam.over.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sam.dao.BookMapper;
import com.sam.dao.SortMapper;
import com.sam.entity.Book;
import com.sam.entity.Msg;
import com.sam.entity.Sort;
import com.sam.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	@Qualifier("bookService")
	private BookService bookService;
	@Autowired
	private SortMapper sortMapper;
	@Autowired
	private BookMapper bookMapper;
	
	@RequestMapping(value="/books")
	@ResponseBody
	public Msg getBookWithJson(@RequestParam(value="pn",defaultValue="1") Integer pn) {
		//当前页，一页展示几条信息；
		PageHelper.startPage(pn,8);
		//startPage后面紧跟的这个查询就是一个分页查询
		List<Book> books = bookService.selectBookAll();
		/*
		 * 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
		 * 封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数
		 */
		PageInfo page = new PageInfo<>(books, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping(value="/book")
	/*
	 * @PathVariable 会把上述@RequestMapping中的{uuid} 赋值给showBookDetail()中的uuid
	 */
	public ModelAndView showBookDetail(@RequestParam("uuid") String uuid,ModelAndView mv) {
		Book book = bookService.selectBookSortByBookuuid(uuid);
		mv.addObject("book", book);
		System.out.println("book:"+book);
		/*
		 * 注：在dispatcherServlet-servlet.xml中配置的是默认返回目录是/WEB-INF/*.jsp
		 *    这里的bookdetail是放在跟/WEB-INF同级目录下的，所以要返回上一层目录../
		 */
		mv.setViewName("../bookdetail");
		return mv;
	}
	
	@RequestMapping(value="/sort0")
	@ResponseBody
	public Msg getSort0() {
		List<Sort> sorts = sortMapper.selectSort_sort_0();
		return Msg.success().add("sort_0", sorts);
	}
	@RequestMapping(value="/sort1")
	@ResponseBody
	public Msg getSort1(@RequestParam(value="sort_0") String sort_0) {
		List<Sort> sorts = sortMapper.selectSort1BySort0(sort_0);
		return Msg.success().add("sort_1", sorts);
	}
	@RequestMapping(value="/sort_1_book")
	@ResponseBody
	public Msg getBookWithSort_1(@RequestParam(value="pn",defaultValue="1") Integer pn,@RequestParam(value="par") String sort_1) {
		//System.out.println(pn+":"+sort_1);
		//当前页，一页展示几条信息；
		PageHelper.startPage(pn,8);
		//startPage后面紧跟的这个查询就是一个分页查询
		List<Book> books = bookMapper.selectBookBySort_1(sort_1);
		/*
		 * 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
		 * 封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数
		 */
		PageInfo page = new PageInfo<>(books, 5);
		return Msg.success().add("pageInfo", page);
	}
	@RequestMapping(value="/sort_0_book")
	@ResponseBody
	public Msg getBookWithSort_0(@RequestParam(value="pn",defaultValue="1") Integer pn,@RequestParam(value="par") String sort_0) {
		//System.out.println(pn+":"+sort_1);
		//当前页，一页展示几条信息；
		PageHelper.startPage(pn,8);
		//startPage后面紧跟的这个查询就是一个分页查询
		List<Book> books = bookMapper.selectBookBySort_0(sort_0);
		/*
		 * 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
		 * 封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数
		 */
		PageInfo page = new PageInfo<>(books, 5);
		return Msg.success().add("pageInfo", page);
	}
	@RequestMapping(value="/search")
	@ResponseBody
	public Msg getBookWithNameLike(@RequestParam(value="pn",defaultValue="1") Integer pn,@RequestParam(value="par") String bookname) {
		PageHelper.startPage(pn,8);
		Book book = new Book();
		book.setName(bookname);
		List<Book> books = bookService.selectBookNameLike(book);
		PageInfo page = new PageInfo<>(books, 5);
		return Msg.success().add("pageInfo", page);
	}

}
