package com.sam.dao;

import com.sam.entity.User;

public interface UserMapper {

	User selectUserById(Integer id);
	User selectUserByName(String name);
	User selectUserByPhone(String phone);
	int insertUser(User user);
}
