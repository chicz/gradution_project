package com.sam.over.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import com.sam.dao.OrderMapper;
import com.sam.dao.UserMapper;
import com.sam.entity.Book;
import com.sam.entity.Cart;
import com.sam.entity.Msg;
import com.sam.entity.Order;
import com.sam.entity.User;
import com.sam.service.BookService;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	@Qualifier("bookService")
	private BookService bookService;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private CartMapper cartMapper;
	
	@RequestMapping(value="/order")
	public ModelAndView to_cart(ModelAndView mv) {
		//System.out.println("request-to-cart");
		mv.setViewName("views/order");
		return mv;
	}
	
	@RequestMapping(value = "build_order")
	@ResponseBody
	public Msg build_order(@RequestParam(value="bookuuids") String[] bookuuids,
			@RequestParam(value="bookcounts") String[] bookcounts,HttpServletRequest request) throws ParseException {
		//获取当前登录的用户
		User user = (User) request.getSession().getAttribute("user");
		//System.out.println("bookuuids:"+bookuuids+"-:bookcounts:"+bookcounts);
		//先找出所有的卖家，判断要生成的订单数
		//String sellers[] = {};
		ArrayList<String> list = new ArrayList<String>();
		//生成订单号的数组，如果前端取消购买，则删除该订单
		ArrayList<String> onlist = new ArrayList<String>();
		for(int i=0;i<bookuuids.length;i++) {
			Book book = bookMapper.selectBookByUuid(bookuuids[i]);
			boolean falg = list.contains(book.getOwner_name());
			if(!falg) {
				System.out.println("seller:"+book.getOwner_name());
				list.add(book.getOwner_name());
			}
		}
		//System.out.println(list);//成功，list中已经包含了所有的卖家
		for(int i=0;i<list.size();i++) {
			//生成第一个订单的uuid
			String order_number = "EH"+UUID.randomUUID().toString().substring(0, 8);
			//生成订单号的数组，如果前端取消购买，则删除该订单	
			onlist.add(order_number);
			//第一个订单的卖家
			String sellers = list.get(i);
			for(int j=0;j<bookuuids.length;j++) {
				//如果bookuuids的uuid属于该卖，则加入到订单表中
				Book book = bookMapper.selectBookByUuid(bookuuids[j]);
				User useller = userMapper.selectUserByName(book.getOwner_name());
				if(book.getOwner_name().equals(sellers)) {
					//插入到订单表中
					Order order = new Order();
					order.setOrder_number(order_number);
					order.setBook_uuid(book.getUuid());
					order.setBook_name(book.getName());
					order.setBook_oneprice(book.getPrice());
					order.setBook_count(Integer.parseInt(bookcounts[j]));
					//单本书的总价，订单的总价从订单表取出后再算
					double booktotalprice = book.getPrice() * Integer.parseInt(bookcounts[j]);
					order.setBook_totalprice(booktotalprice);
					order.setBuyer_loginname(user.getLoginname());
					order.setBuyer_phone(user.getPhone());
					order.setSeller_name(sellers);
					order.setSeller_phone(useller.getPhone());
					Date date = new Date();
					//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					//String dString = sdf.format(date);
					order.setMaketime(date);
					order.setStatus("1");
					order.setDel_flag("1");
					System.out.println("测试产生的订单:"+order);
					//将订单存入数据库
					orderMapper.insertOrder(order);
					//删除购物车
					Cart cart = new Cart();
					cart.setUser_loginname(user.getLoginname());
					cart.setBook_uuid(book.getUuid());
					cartMapper.deleteCart(cart);
				}
			}
		}
		
		//String order_number = "EH"+UUID.randomUUID().toString().substring(0, 8);
		//System.out.println(order_number);
		/*for(int i=0 ; i<bookuuids.length ; i++) {
			System.out.println("书本的uuid:"+bookuuids[i]+"-购买数量:"+bookcounts[i]);
		}*/
		return Msg.success().add("order_number", onlist);
	}
	
	@RequestMapping(value = "del_order")
	@ResponseBody
	public Msg del_order(@RequestParam(value="order_numbers") String[] ordernumbers,HttpServletRequest request){
		System.out.println("ordernumbers:"+ordernumbers);
		for(int i=0;i<ordernumbers.length;i++) {
			System.out.println(ordernumbers[i]);
			orderMapper.deleteOrder(ordernumbers[i]);
		}
		return Msg.success();
	}
	
	@RequestMapping(value="show_order")
	@ResponseBody
	public Msg show_order(@RequestParam(value="order_number")String ordernumber) {
		
		List<Order> list = orderMapper.selectOrderByOrderNumber(ordernumber);		
		System.out.println(list);
		return Msg.success().add("orders", list);
	}
	
	@RequestMapping(value="select_allorder")
	@ResponseBody
	public Msg show_allorder(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		//先查出当前用户所拥有的所有订单号
		List<Order> listonumber = orderMapper.selectOrderNumberByBuyername(user.getLoginname());
		ArrayList<String> list = new ArrayList<String>();
		for(Order order : listonumber) {
			list.add(order.getOrder_number());
		}
		System.out.println(listonumber);
		return Msg.success().add("order_numbers", list);
	}

}
