package com.sam.admin.dao;

import org.apache.ibatis.annotations.Param;

import com.sam.admin.entity.User;

public interface UserMapper {

	User selectUserById(Integer id);
	User selectUserByName(String name);
	User selectUserByPhone(String phone);
	int insertUser(User user);
	int updateSellerpwd(@Param("user") User user);
}
