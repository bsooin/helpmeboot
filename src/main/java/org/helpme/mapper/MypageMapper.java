package org.helpme.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.helpme.domain.MemberVO;
import org.helpme.domain.MypageCriteria;
import org.helpme.domain.PointVO;
import org.helpme.domain.ServiceVO;
import org.helpme.dto.DealDTO;
import org.helpme.dto.LikeserviceDTO;
import org.helpme.dto.ReviewDTO;

import java.util.List;

@Mapper
public interface MypageMapper {

	
	  public MemberVO selectId(String userId) throws Exception;

	
	// like한 서비스 정보 불러오기
	public ServiceVO selectMyLikeService(int sNo) throws Exception;



	public PointVO selectMyPoint(String userId) throws Exception;


	// 페이징  - 거래  ok
	public List<DealDTO> listCriteria(String userId) throws Exception;

	public int listSearchCount(MypageCriteria cri) throws Exception;

	// 페이징  - 리뷰  ok
	public List<ReviewDTO> listReviewCriteria(String userId) throws Exception;

	public int listReviewSearchCount(MypageCriteria cri) throws Exception;
	
	// 페이징  - 찜 목록 ok
	public List<LikeserviceDTO> listLikeCriteria(String userId) throws Exception;

	public int listLikeSearchCount(MypageCriteria cri) throws Exception;
	

	
	// 최근 본 서비스
	public ServiceVO listLatestCriteria(int sNo) throws Exception;
	
	public int listLatestSearchCount(MypageCriteria cri) throws Exception;
	// public List<ServiceVO> selectMyLatest(String userId) throws Exception;
	
	
	
}
