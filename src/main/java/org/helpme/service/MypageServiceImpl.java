package org.helpme.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.helpme.domain.MemberVO;
import org.helpme.domain.MypageCriteria;
import org.helpme.domain.PointVO;
import org.helpme.domain.ServiceVO;
import org.helpme.dto.DealDTO;
import org.helpme.dto.LikeserviceDTO;
import org.helpme.dto.ReviewDTO;
import org.helpme.mapper.MypageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MypageServiceImpl implements MypageService {
	//@Autowired
	@Autowired
	private MypageMapper mapper;


	// 회원 정보 조회
	@Override
	public MemberVO selectId(String userId) throws Exception{

		return mapper.selectId(userId);
	}
	/*
	 * @Override public List<DealVO> selectMyDeal(String userId) throws Exception {
	 * return mapper.selectMyDeal(userId); }
	 *
	 * @Override public List<ReviewVO> selectMyReview(String userId) throws
	 * Exception { return mapper.selectMyReview(userId); }
	 *
	 * @Override public List<QnaVO> selectMyQna(String userId) throws Exception {
	 * return mapper.selectMyQna(userId); }

	 */

	@Override
	public PointVO selectMyPoint(String userId) throws Exception {
		return mapper.selectMyPoint(userId);
	}




	@Override
	public ServiceVO selectMyLikeService(int sNo) throws Exception {
		return mapper.selectMyLikeService(sNo);
	}




	// 페이징
	// 거래 내역
	@Override
	public List<DealDTO> listCriteria(String userId) throws Exception {
		return mapper.listCriteria(userId);
	}

	@Override
	public int listSearchCount(MypageCriteria cri) throws Exception {
		return mapper.listSearchCount(cri);
	}

	// 리뷰
	@Override
	public List<ReviewDTO> listReviewCriteria(String userId) throws Exception {
		return mapper.listReviewCriteria(userId);
	}

	@Override
	public int listReviewSearchCount(MypageCriteria cri) throws Exception {
		return mapper.listReviewSearchCount(cri);
	}

	// 찜 목록
	@Override
	public List<LikeserviceDTO> listLikeCriteria(String userId) throws Exception {
		return mapper.listLikeCriteria(userId);
	}

	@Override
	public int listLikeSearchCount(MypageCriteria cri) throws Exception {
		return mapper.listLikeSearchCount(cri);
	}


	// 최근 본 서비스
	@Override
	public ServiceVO listLatestCriteria(int sNo) throws Exception {
		return mapper.listLatestCriteria(sNo);
	}

	@Override
	public int listLatestSearchCount(MypageCriteria cri) throws Exception {
		return mapper.listLatestSearchCount(cri);
	}






}