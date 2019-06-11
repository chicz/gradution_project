package com.sam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sam.entity.Order;

public interface OrderMapper {

	int insertOrder(Order order);
	int deleteOrder(@Param(value="order_number")String order_number);
	List<Order> selectOrderByOrderNumber(@Param(value="order_number")String order_number);
	List<Order> selectOrderNumberByBuyername(@Param("buyer_loginname")String buyer_loginnmae);
}
