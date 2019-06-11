package com.sam.dao;

import java.util.List;

import com.sam.entity.BookSort;

public interface BookSortMapper {

    /*
     * 作用见com.sam.entity.BookSort注释说明（目前没发现任何的作用）
     */
	BookSort selectBookSortById(Integer id);
	List<BookSort> slectBookSortBySortnumber(String sort_number);
	BookSort selectBookSortByBookuuid(String book_uuid);
}
