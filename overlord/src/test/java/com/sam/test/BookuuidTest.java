package com.sam.test;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

public class BookuuidTest {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		String uid = "";
		String sjc = "";
		/*
		DecimalFormat df = new DecimalFormat("######0.00");
		String d5 = "3.156";
		Double dtest = Double.parseDouble(d5);
		System.out.println(dtest);
		System.out.println(df.format(dtest));*/
		/*double d1 = 3.1256;
		double d2 = 3;
		double d3 = 3.1246;
		double d4 = 3.175566;
		//String d5 = "3.1234";
		//注：DecimalFormat自带四舍五入
		System.out.println("format前："+d1+":"+d2+":"+d3+":"+d4);
		df.format(d1);df.format(d2);df.format(d3);df.format(d4);
		System.out.println("format后："+df.format(d1)+":d1:"+d1+":"+df.format(d2)+":"+df.format(d3)+":"+df.format(d4));*/
		for(int i=0;i<3;i++) {
			uid = UUID.randomUUID().toString().substring(0, 10);
			System.out.println(i+":"+uid);
			sjc = ""+System.currentTimeMillis();
			System.out.println("时间戳:"+sjc);
			Thread.sleep(1000);
		}
		/*ArrayList<String> list = new ArrayList<String>();//测试成功
		list.add("0");
		list.add("1");
		list.add("2");
		System.out.println(list.size());
		System.out.println(list.get(2)+":"+list.get(1)+":"+list.get(0));*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//测试成功
		Date date = new Date();
		System.out.println(date);
		System.out.println(sdf.format(date));
	}

}
