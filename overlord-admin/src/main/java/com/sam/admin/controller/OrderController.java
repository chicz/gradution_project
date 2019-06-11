package com.sam.admin.controller;

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

import com.sam.admin.dao.BookMapper;

import com.sam.admin.dao.OrderMapper;
import com.sam.admin.dao.UserMapper;
import com.sam.admin.entity.Book;
import com.sam.admin.entity.Msg;
import com.sam.admin.entity.Order;
import com.sam.admin.entity.User;
import com.sam.admin.service.BookService;

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
	
	@RequestMapping("order-list")
	public String to_order_list() {
		return "admin/order-list";
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
		List<Order> listonumber = orderMapper.selectOrderNumberBySellername(user.getLoginname());
		ArrayList<String> list = new ArrayList<String>();
		for(Order order : listonumber) {
			list.add(order.getOrder_number());
		}
		System.out.println(listonumber);
		return Msg.success().add("order_numbers", list);
	}

}
