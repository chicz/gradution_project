package com.sam.admin.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sam.admin.dao.BookMapper;
import com.sam.admin.dao.BookSortMapper;
import com.sam.admin.dao.SortMapper;
import com.sam.admin.entity.Book;
import com.sam.admin.entity.Msg;
import com.sam.admin.entity.Sort;
import com.sam.admin.entity.User;
import com.sam.admin.service.UserService;

@Controller
@RequestMapping("add")
public class AddBookController {

	@Autowired
	@Qualifier("userService")
	private UserService userService;
	@Autowired 
	private SortMapper sortMapper;
	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private BookSortMapper bookSortMapper;
	
	@RequestMapping(value = "add_book")
	public String add_book(@RequestParam("bookname") String bookname,@RequestParam("bookprice") String bookprice,
			@RequestParam("bookgrade") String bookgrade,@RequestParam("bookauthor") String bookauthor,
			@RequestParam("bookpress") String bookpress,@RequestParam("bookversion") String bookversion,
			@RequestParam("commodityTypeId1") String sort_0,@RequestParam("commodityTypeId2") String sort_1,
			@RequestParam("bookremark") String bookremark,@RequestParam("file") MultipartFile[] files, 
			HttpServletRequest request) {
		
		System.out.println("name:"+bookname+"price:"+bookprice+"grade:"+bookgrade+"author:"+bookauthor+"press:"+bookpress+"version:"+bookversion+"sort_0:"+sort_0+"sort_1:"+sort_1+"remark:"+bookremark);
		//System.out.println("files:"+files);
		String uuid = "";
		uuid = UUID.randomUUID().toString().substring(0, 6);
		
		//添加到分类表tb_book_sort
		Sort sort = sortMapper.selectSortBySort_1(sort_1);
		String number = sort.getNumber();
		bookSortMapper.insertSortNumberAndUuid(number, uuid);
		
		//添加到tb_book
		Book book = new Book();
		book.setUuid(uuid);
		book.setName(bookname);
		DecimalFormat df = new DecimalFormat("######0.00");
		Double price = Double.parseDouble(bookprice);//6.2041    这个是转为double类型  
		bookprice = df.format(price);
		price = Double.parseDouble(bookprice);
		book.setPrice(price);
		int grade = Integer.parseInt(bookgrade);
		book.setGrade(grade);
		book.setRemark(bookremark);
		book.setAuthor(bookauthor);
		book.setPress(bookpress);
		book.setVersion(bookversion);
		book.setPic_0(uuid+"_0.jpg");
		book.setPic_1(uuid+"_1.jpg");
		book.setPic_2(uuid+"_2.jpg");
		book.setPic_3(uuid+"_3.jpg");
		book.setPic_4(uuid+"_4.jpg");
		User user = (User) request.getSession().getAttribute("user");
		String owner_name = user.getLoginname();
		book.setOwner_name(owner_name);
		bookMapper.insertBook(book);
		
		//System.out.println("uuid:"+uuid);
		if (files != null && files.length > 0) {
			int start = 0;
			if(files.length>3) {
				start = files.length-3;
			}
			
			for (int i = start ; i < files.length; i++) {
				MultipartFile file = files[i];
				String filename = uuid+"_"+i;
				// 调用储存file的函数
				//System.out.println(file);
				saveFile(request, file, filename);
			}
		}
		return "admin/add_book_success";
	}
	
	/*
	 * 存储file的函数
	 */
	private boolean saveFile(HttpServletRequest request, MultipartFile file, String filename) {
		if (!file.isEmpty()) {
			try {
				MultipartFile file2 = file;
				//File filepath = new File("");
				//System.out.println(request.getContextPath());
				
				//获取文件后缀名
				//String fileName1 = file.getOriginalFilename();
				//String suffix = fileName1.substring(fileName1.lastIndexOf(".") + 1);
		        //System.out.println(suffix);
				//filename = filename+"."+suffix;
				filename = filename+"."+"jpg";
				//上传文件路径
				String path = "D://overlord";
				
				//String filename = file.getOriginalFilename();
				//System.out.println("path:"+path+",filename:"+filename);
				
				File saveserviceDir = new File(path,filename);
				
				if(!saveserviceDir.getParentFile().exists()) {
					saveserviceDir.getParentFile().mkdirs();
				}
				// 文件转存
				//
				file2.transferTo(saveserviceDir);
				//file.transferTo(saveDir);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	@RequestMapping(value="set_count")
	@ResponseBody
	public Msg set_count(@RequestParam("count")Integer count,@RequestParam("uuid")String uuid) {
		System.out.println("更改bookcount:"+count+"--uuid:"+uuid);
		if(count>=0) {
			bookMapper.setBookCountByUuid(count, uuid);
			return Msg.success();
		}
		return Msg.fail();
	}
	
}
