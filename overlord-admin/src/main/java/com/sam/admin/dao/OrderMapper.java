package com.sam.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sam.admin.entity.Order;

public interface OrderMapper {

	int insertOrder(Order order);
	int deleteOrder(@Param(value="order_number")String order_number);
	List<Order> selectOrderByOrderNumber(@Param(value="order_number")String order_number);
	List<Order> selectOrderNumberBySellername(@Param("seller_name")String seller_nmae);
}
