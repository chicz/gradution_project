package com.sam.over.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sam.dao.BookMapper;
import com.sam.dao.CartMapper;
import com.sam.dao.UserMapper;
import com.sam.entity.Cart;
import com.sam.entity.Msg;
import com.sam.entity.User;

@Controller
@RequestMapping("buy")
public class BuyController {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private CartMapper cartMapper;
	
	@RequestMapping("home_buy")
	@ResponseBody
	public Msg home_buy(@RequestParam(value="uuid") String uuid,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		//先找出该商品是否已经在购物车中
		Cart cart1 = cartMapper.selectCartByBookUuidWithLoginname(uuid, user.getLoginname());
		if(cart1!=null) {
			String sessionname = user.getLoginname();
			String cartname = cart1.getUser_loginname();
			System.out.println("当前登录用户："+sessionname+"-当前书籍所属购物车用户："+cartname);
			if(sessionname.equals(cartname)) {
				return Msg.fail().add("msg", "购物车已有该商品！请重新选择其它商品，谢谢！");
			}	
		}
			
		Cart cart = new Cart();
		cart.setBook_uuid(uuid);
		cart.setUser_loginname(user.getLoginname());
		cartMapper.insertCart(cart);
		return Msg.success().add("cart", cart);
	}
}
