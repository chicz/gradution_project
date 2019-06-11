package com.sam.admin.service;

import com.sam.admin.entity.User;

public interface UserService {
	/*
	 * 判断用户登录
	 * @param String loginname
	 * @param String password
	 * @return 找到返回User对象，没有找到返回null
	 */
	User login(String loginname,String password);
	User loginByPhone(String phone);
	public void register(User user);
	User checkuser(String loginname);
	User checkphone(String phone);

}
