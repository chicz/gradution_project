package com.sam.over.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sam.entity.Msg;
import com.sam.entity.User;
import com.sam.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	/*
	 * /login_old和/login的实现目的是一样的
	 * 只是，当用户名或密码错误时，因为登录界面使用的是模态框
	 * 使用ModelAndView会返回页面，所以模态框会被关闭，这里没有找到很好的解决办法，故用ajax代替
	 */
	@RequestMapping(value="/login_old")
	public ModelAndView login(String loginname,String password,ModelAndView mv,HttpSession session) {
		//public ModelAndView login(@RequestParam(value="loginname") String loginname,@RequestParam(value="password") String password,ModelAndView mv,HttpSession session) {
		//System.out.println("loginname:"+loginname+",password:"+password);
		User user = userService.login(loginname, password);
		System.out.println("user:"+user);
		if (user == null) {
			mv.setViewName("../index");
			mv.addObject("message", "登录名或密码错误，请重新输入！");
			//mv.setViewName("../register");
			
		} else if (user.getLoginname().equals(loginname) && user.getPassword().equals(password)) {

			String gender = user.getSex();
			System.out.println("gender1:" + gender);
			gender = "男".equals(gender) ? "先生" : "女士";
			System.out.println("gender2:" + gender);
			session.setAttribute("gender", gender);
			session.setAttribute("user", user);
		   // mv.setView(new RedirectView("login"));
			mv.setViewName("../index");
		} else {
			mv.addObject("message", "登录名或密码错误，请重新输入！");
			//mv.setViewName("../register");
			return null;
		}
		return mv;
	}
	@RequestMapping(value="/login")
	@ResponseBody
	public User Login2(@RequestParam(value="loginname") String loginname,@RequestParam(value="password") String password,HttpSession session) {
		//session.removeAttribute("user");
		//System.out.println("1--lognname:"+loginname+",password:"+password);
		//判断是邮箱还是手机号的正则表达式  
        //String em = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";  
        String ph = "^[1][34578]\\d{9}$";
        User user = new User();
        String login = "";
        if(loginname.matches(ph)) {
        	System.out.println("输入手机号");
            user = userService.loginByPhone(loginname);
            System.out.println(user);
            if(user!=null) login = ""+user.getPhone();
            System.out.println("login:"+login);
        }else {
        	System.out.println("输入用户名");
        	user = userService.login(loginname, password);
        	System.out.println(user);
        	if(user!=null) login = user.getLoginname();
        	System.out.println("login:"+login);
        }
		//User user = userService.login(loginname, password);
		//System.out.println("user:"+user);
		//System.out.println("user.getLoginname:"+user.getLoginname());
		//User user2 = new User();
		//user2.setLoginname(user.getLoginname());
		//System.out.println(user2);
        if(user == null) {
        	return null;
        }else if (login.equals(loginname) && user.getPassword().equals(password)) {
			String gender = user.getSex();
			System.out.println("gender1:" + gender);
			gender = "男".equals(gender) ? "先生" : "女士";
			session.setAttribute("gender", gender);
			session.setAttribute("user", user);
			return user;
			// return user2;
		} else {
			session.setAttribute("message", "用户名或密码错误！");
		}
		return null;
	}
	
	@RequestMapping(value="/exit")
	public ModelAndView exit(ModelAndView mv,HttpSession session) {
		session.removeAttribute("user");
		/*if(session.getAttribute("user")==null) System.out.println(">>>>>>null>>>>");
		if(session.getAttribute("user")=="null") System.out.println("<<<<<<\"null\"<<<<<<");*/
		mv.setView(new RedirectView("index.jsp"));
		//mv.setViewName("../index");
		return mv;
	}
	@RequestMapping(value="/register")
	public ModelAndView register(String username,String loginname,
			String password,String phone,
			String birthday,String sex,
			String email,String address,
			String question,String answer,
			ModelAndView mv) throws ParseException {
		System.out.println("得到的数据："+username+loginname+password+phone+birthday+sex+email+address+question+answer);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(false);
		Date date = new Date();
		//如果没有输入日期，则默认为当前日期
		//因为设置了日期无论如何都有值，所以返回的user一定不为null，则ajax总是进入success
		if(birthday==null||birthday=="") birthday=sdf.format(date);
		User user = new User();
		user.setUsername(username);
		user.setLoginname(loginname);
		user.setPassword(password);
		user.setPhone(phone);
		user.setBirthday(sdf.parse(birthday));
		if(sex=="M") {
			sex="男";
		}else {
			sex="女";
		}
		user.setSex(sex);
		user.setEmail(email);
		user.setAddress(address);
		user.setQuestion(question);
		user.setAnswer(answer);     
		userService.register(user);
		mv.setView(new RedirectView("index.jsp"));
		return mv;
	}
	/*@RequestMapping(value="/register")
	@ResponseBody
	public User register(@RequestParam(value="username") String username,@RequestParam(value="loginname") String loginname,
			@RequestParam(value="password") String password,@RequestParam(value="phone") String phone,
			@RequestParam(value="birthday") String birthday,@RequestParam(value="sex") String sex,
			@RequestParam(value="email") String email,@RequestParam(value="address") String address,
			@RequestParam(value="question") String question,@RequestParam(value="answer") String answer,
			HttpSession session) throws ParseException {
		System.out.println("得到的数据："+username+loginname+password+phone+birthday+sex+email+address+question+answer);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(false);
		Date date = new Date();
		//如果没有输入日期，则默认为当前日期
		//因为设置了日期无论如何都有值，所以返回的user一定不为null，则ajax总是进入success
		if(birthday==null||birthday=="") birthday=sdf.format(date);
		//System.out.println(birthday);
		User user = new User();
		user.setUsername(username);
		user.setLoginname(loginname);
		user.setPassword(password);
		user.setPhone(phone);
		user.setBirthday(sdf.parse(birthday));
		user.setSex(sex);
		user.setEmail(email);
		user.setAddress(address);
		user.setQuestion(question);
		user.setAnswer(answer);     
        return user;  
		//userService.register(user);
		
	}*/
	@RequestMapping(value="/checkuser")
	@ResponseBody
	public User checkuser(@RequestParam(value="loginname") String loginname) {
		User user = new User();
		user = userService.checkuser(loginname);
		System.out.println("checkuser:"+user);
		return user;
	}
	@RequestMapping(value="/checkphone")
	@ResponseBody
	public User checkphone(@RequestParam(value="phone") String phone) {
		User user = new User();
		user = userService.checkphone(phone);
		System.out.println("checkphone:"+user);
		return user;
	}
	@RequestMapping(value="/checkphone_byjson")
	@ResponseBody
	public Msg checkphone_byjson(@RequestParam(value="phone") String phone) {
		User user = new User();
		user = userService.checkphone(phone);
		System.out.println("checkphone:"+user);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", user);
		return Msg.success().add("emp", user);
		/*
		 * 对应后端ajax取值为 result.extend.emp.loginname
		 *              result.extend.emp.password....
		 * 注，这里的extend是在Msg类里面add()返回的extend
		 */
	}

}
