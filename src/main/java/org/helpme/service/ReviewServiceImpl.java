package org.helpme.service;

import org.helpme.domain.Criteria;
import org.helpme.domain.ReviewVO;
import org.helpme.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> listReviewPage(Integer sNo, Criteria cri) throws Exception {
		System.out.println(sNo);
		System.out.println(cri.getPageStart()+"/dd/"+cri.getPerPageNum());
		return reviewMapper.listReviewPage(sNo, cri.getPageStart(),cri.getPerPageNum());
	}

	@Override
	public int count(Integer sNo) throws Exception {
		return reviewMapper.count(sNo);
	}

	@Override
	public void removeReview(Integer rNo) {
		reviewMapper.remove(rNo);
		
	}

	@Override
	public void modifyReview(ReviewVO reviewVO) {
		reviewMapper.modify(reviewVO);
		
	}

	@Override
	public void addReview(ReviewVO reviewVO) {
		reviewMapper.add(reviewVO);
		
	}

}
