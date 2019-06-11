package com.sam.book.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sam.dao.SortMapper;
import com.sam.entity.Sort;

/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring/applicationContext.xml"})*/
public class SortSearchTest {
	
	@Autowired
	private SortMapper sortMapper;
	
	/*@Test*/
	public void test() {
		List<Sort> sorts = sortMapper.selectSort_sort_0();
		//List<Sort> sorts1 = sortMapper.selectSortAll();
		List<Sort> sorts1 = sortMapper.selectSort1BySort0("哲学");
		System.out.println("<<<<<<<<"+sorts);
		for(Sort sort : sorts) {
			System.out.println(">>>>"+sort);
		}
		System.out.println("--------------我是分割线---------------");
		for(Sort sort : sorts1) {
			System.out.println(sort);
		}
	}

}
