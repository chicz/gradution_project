package com.sam.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sam.admin.entity.Sort;


public interface SortMapper {

	
	Sort selectSortById(Integer id);
	Sort selectSortByNumber(String number);
	List<Sort> selectSortBySort_0(String sort_0);
	Sort selectSortBySort_1(@Param(value="sort_1")String sort_1);
	
	List<Sort> selectSort_sort_0();
	List<Sort> selectSortAll();
	/*
	 * 不添加@Param(value="sort_0"),则SortMapper.xml中的动态sql<where>获取不到参数报错
	 */
	List<Sort> selectSort1BySort0(@Param(value="sort_0")String sort_0);
	
}
