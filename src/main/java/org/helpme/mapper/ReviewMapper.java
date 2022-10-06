package org.helpme.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.helpme.domain.ReviewVO;

import java.util.List;

@Mapper
public interface ReviewMapper {
	
	List<ReviewVO> listReviewPage
	(@Param("sNo")Integer sNo,@Param("pageStart") int pageStart,@Param("perPageNum") int perPageNum) throws Exception;
	
	int count(Integer sNo) throws Exception;

	void remove(Integer rNo);

	void modify(ReviewVO reviewVO);

	void add(ReviewVO reviewVO);
	
}
