package com.sam.over.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sam.dao.BookMapper;
import com.sam.dao.CartMapper;
import com.sam.dao.SortMapper;
import com.sam.dao.UserMapper;
import com.sam.entity.Book;
import com.sam.entity.Cart;
import com.sam.entity.Msg;
import com.sam.entity.User;
import com.sam.service.BookService;

@Controller
@RequestMapping("cart")
public class CartController {

	@Autowired
	@Qualifier("bookService")
	private BookService bookService;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private SortMapper sortMapper;
	
	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@RequestMapping(value="/cart")
	public ModelAndView to_cart(ModelAndView mv) {
		//System.out.println("request-to-cart");
		mv.setViewName("views/cart");
		return mv;
	}
	
	@RequestMapping(value="/search_cart")
	@ResponseBody
	public Msg search_cart(HttpServletRequest request) {
		System.out.println("into add/search_cart");
		User user = (User) request.getSession().getAttribute("user");
		List<Cart> carts = cartMapper.selectCartByUserLoginname(user.getLoginname());
		return Msg.success().add("cart_book_list", carts);
	}
	
	@RequestMapping(value = "/cart_book")
	@ResponseBody
	public Msg cart_book(@RequestParam("uuid") String uuid) {
		Book book = bookMapper.selectBookByUuid(uuid);
		if(book!=null) {
			return Msg.success().add("cart_book", book);
		}
		return Msg.fail();
	}
	
	@RequestMapping(value = "/del_cart")
	@ResponseBody
	public Msg del_cart(@RequestParam(value="uuid") String uuid,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		Cart cart = new Cart();
		cart.setUser_loginname(user.getLoginname());
		cart.setBook_uuid(uuid);
		cartMapper.deleteCart(cart);
		return Msg.success();
	}
}
