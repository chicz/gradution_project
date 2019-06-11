package com.sam.admin.controller;


import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sam.admin.dao.BookMapper;
import com.sam.admin.dao.SortMapper;
import com.sam.admin.dao.UserMapper;
import com.sam.admin.entity.Book;
import com.sam.admin.entity.Msg;
import com.sam.admin.entity.Sort;
import com.sam.admin.entity.User;
import com.sam.admin.service.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	@Autowired
	private UserMapper userMapper;
	@Autowired 
	private SortMapper sortMapper;
	@Autowired
	private BookMapper bookMapper;
	
	//查询角色所有信息
	@RequestMapping("admin_info_select")
	@ResponseBody
	public Map<String, Object> admin_info_select(@RequestParam("loginname") String loginname) {
		User user = userService.login(loginname, "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birthday = sdf.format(user.getBirthday());
		Map<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("birthday", birthday);
		return map;
	}
	@RequestMapping(value = "/check_old_pwd")
	@ResponseBody
	public Msg check_old_pwd(@RequestParam("username") String username,@RequestParam("old_password") String old_password) {
		//System.out.println(username+":"+old_password);
		User user = userService.checkuser(username);
		System.out.println(user);
		if(old_password.equals(user.getPassword())) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	@RequestMapping(value = "/change_pwd")
	public String change_pwd_page() {
		//这个是从main返回change_pwd.html
		return "admin/change_pwd";
	}
	@RequestMapping(value="/change_pwd_post")
	@ResponseBody
	public Msg change_pwd_post(@RequestParam("username") String username,
			@RequestParam("new_password") String new_password) {
		//这个是确认修改密码后返回的数据
		//System.out.println("change_pwd:"+username+";:"+new_password);
		User user = new User();
		user.setLoginname(username);
		user.setPassword(new_password);
		userMapper.updateSellerpwd(user);
		return Msg.success();
	}
	
	@RequestMapping(value = "/book_list")
	public String show_book_list() {
		return "admin/book_list";
	}
	
	@RequestMapping(value = "/book_list/sort_0")
	@ResponseBody
	public Msg show_sort_0() {
		List<Sort> sorts = sortMapper.selectSort_sort_0();
		return Msg.success().add("sort_0", sorts);
	}
	
	@RequestMapping(value = "/book_list/sort_1")
	@ResponseBody
	public Msg show_sort_1(@RequestParam(value="sort_0") String sort_0) {
		List<Sort> sorts = sortMapper.selectSort1BySort0(sort_0);
		return Msg.success().add("sort_1", sorts);
	}
	
	@RequestMapping(value = "/book_list/show_book_list")
	@ResponseBody
	@SuppressWarnings({"rawtypes", "unchecked"})
	public Msg show_book_list(@RequestParam(value="name") String name,@RequestParam(value="uuid") String uuid
			,@RequestParam(value="sort_0") String sort_0,@RequestParam(value="sort_1") String sort_1
			,@RequestParam(value="status") String status,@RequestParam(value="pn",defaultValue="1") Integer pn
			,HttpServletRequest request) {
		//System.out.println(name+uuid+sort_0+sort_1+status);
		//List<Sort> sorts = sortMapper.selectSort1BySort0(sort_0);
		//return Msg.success().add("sort_1", sorts);
		User user = (User) request.getSession().getAttribute("user");
		//System.out.println(user.getLoginname());
		PageHelper.startPage(pn, 5);
		List<Book> books = bookMapper.selectBookByConditions(name, uuid, sort_0, sort_1, status,user.getLoginname());
		//System.out.println("books:"+books);
		PageInfo page = new PageInfo(books,5);
		//System.out.println("page:"+page);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping(value = "/edit-a/{uuid}")
	@ResponseBody
	public Msg getEdit(@PathVariable("uuid") String uuid) {
		System.out.println(uuid);
		return Msg.success();
	}
	@RequestMapping(value = "/sxjia-a")
	@ResponseBody
	public Msg getSxjia(@RequestParam("uuid") String uuid,@RequestParam("status") String status,HttpServletRequest request) {
		System.out.println("传过来的值："+uuid+status);
		User user = (User) request.getSession().getAttribute("user");
		//判断传过来的uuid是否是当前登录用户所拥有的，如果不是，则返回失败
		Book book = bookMapper.selectBookByUuid(uuid);
		System.out.println("user:"+user);
		System.out.println("book："+book);
		String owner_name = book.getOwner_name();
		//根据传过来的status，更新相反的uuid就好
		System.out.println("sxjia-a:"+uuid+":"+status+":"+user);
		String change_status = "";
		if(status.equals("1")) {
			change_status = "0";
		}
		if(status.equals("0")) {
			change_status = "1";
		}
		if(owner_name.equals(user.getLoginname())) {
			//执行更新操作
			System.out.println("sxjia-a:"+uuid+":"+status+":"+change_status+":"+user);
			bookMapper.updateStatusByUuid(uuid, change_status);
			return Msg.success().add("status", change_status);
		}
		System.out.println("sxjia-a:"+uuid+":"+status+":"+change_status+":"+user);
		return Msg.fail();
	}
	@RequestMapping(value = "/del-a")
	@ResponseBody
	public Msg getDel(@RequestParam("uuid") String uuid,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		//判断传过来的uuid是否是当前登录用户所拥有的，如果不是，则返回失败
		Book book = bookMapper.selectBookByUuid(uuid);
		String owner_name = book.getOwner_name();
		if(owner_name.equals(user.getLoginname())) {
			//执行删除操作
			bookMapper.delBookByUuid(uuid);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping(value = "/add_book")
	public String add_book() {
		return "admin/add_book";
	}

}
