package com.sam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.sam.entity.Cart;

public interface CartMapper {
	
	List<Cart> selectCartByUserLoginname(@Param(value="user_loginname") String user_loginname);
	Cart selectCartByBookUuid(@Param(value="book_uuid") String book_uuid);
	int insertCart(Cart cart);
	/*int updateCart(Cart cart);*/
	int deleteCart(Cart cart);
	//这个的用处是，如果购物中有两个人都添加了这个商品，那么上面的selectCartByBookUuid将会有两条记录，那么就会出错
	Cart selectCartByBookUuidWithLoginname(@Param(value="book_uuid") String book_uuid,@Param(value="user_loginname")String user_loginname);

}
