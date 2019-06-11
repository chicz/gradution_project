package com.sam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sam.dao.UserMapper;
import com.sam.entity.User;
import com.sam.service.UserService;

@Service ("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	@Override
	public User login(String loginname,String password) {
		return userMapper.selectUserByName(loginname);
	}
	@Override
	public User loginByPhone(String phone) {
		return  userMapper.selectUserByPhone(phone);
	}
	@Override
	public void register(User user) {
		userMapper.insertUser(user);
	}
	@Override
	public User checkuser(String loginname) {
		return userMapper.selectUserByName(loginname);
	}
	@Override
	public User checkphone(String phone) {
		return userMapper.selectUserByPhone(phone);
	}

}
