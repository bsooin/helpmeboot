package org.helpme.service;

import org.helpme.domain.CommunityVO;
import org.helpme.domain.Criteria;
import org.helpme.domain.SearchCriteria;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommunityService {
	// 게시글 리스트
	public List<CommunityVO> list() throws Exception;
	// 게시글 보기
	public CommunityVO view(Integer cBoardId) throws Exception;
	// 게시글 작성
	public void write(CommunityVO CommunityVO) throws Exception;
	public void write(Integer cBoardId) throws Exception;
	// 게시글 삭제
	public void remove(Integer cBoardId) throws Exception;
	// 게시글 수정
	public void modify(CommunityVO CommunityVO) throws Exception;
	
	// 사용X
	 
	 public List<CommunityVO> listCriteria(Criteria cri) throws Exception;
	 public int listCountCriteria(Criteria cri) throws Exception;
	 public List<CommunityVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	 public int listSearchCount(SearchCriteria cri) throws Exception;
}
