package com.sam.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sam.admin.entity.Msg;
import com.sam.admin.entity.User;
import com.sam.admin.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@RequestMapping("/login")
	@ResponseBody
	public Msg welcome(@RequestParam("loginname") String loginname,@RequestParam("password") String password,HttpSession session) {
		//System.out.println("loginname:"+loginname+",password:"+password);
		User user = userService.login(loginname, password);
		System.out.println(user);
		if(user == null) {
        	return Msg.fail().add("message", "用户名不存在！").add("code", "001");
        }else if (user.getLoginname().equals(loginname) && user.getPassword().equals(password)) {
			session.setAttribute("user", user);
			return Msg.success().add("message", "登录成功！");
			// return user2;
		} else {
			return Msg.fail().add("message", "密码错误！").add("code", "002");
		}
	}
	@RequestMapping("/main")
	public String main() {
		return "admin/main";
	}
	@RequestMapping(value="/welcome")
	public String welcome() {
		return "admin/welcome";
	}
	@RequestMapping(value="/exit")
	public String exit(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/index";
	}

}
