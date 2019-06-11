package com.sam.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sam.admin.entity.BookSort;


public interface BookSortMapper {

    /*
     * 作用见com.sam.entity.BookSort注释说明（目前没发现任何的作用）
     */
	BookSort selectBookSortById(Integer id);
	List<BookSort> slectBookSortBySortnumber(String sort_number);
	BookSort selectBookSortByBookuuid(String book_uuid);
	
	//添加商品时，在tb_book_sort添加
	int insertSortNumberAndUuid(@Param(value="sort_number")String number,@Param(value="book_uuid")String uuid);
}
