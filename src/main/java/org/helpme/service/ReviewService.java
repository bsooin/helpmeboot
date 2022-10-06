package org.helpme.service;

import org.helpme.domain.Criteria;
import org.helpme.domain.ReviewVO;

import java.util.List;

public interface ReviewService {

	List<ReviewVO> listReviewPage(Integer sNo, Criteria cri) throws Exception;
	
	int count(Integer sNo) throws Exception;

	void removeReview(Integer rNo);

	void modifyReview(ReviewVO reviewVO);

	void addReview(ReviewVO reviewVO);

	  
	 
}

