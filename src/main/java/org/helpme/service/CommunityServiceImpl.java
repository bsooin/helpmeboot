package org.helpme.service;

import org.helpme.domain.CommunityVO;
import org.helpme.domain.Criteria;
import org.helpme.domain.SearchCriteria;
import org.helpme.mapper.CommunityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityMapper mapper;
	
	// 게시판 리스트
	@Override
	public List<CommunityVO> list() throws Exception {
		return mapper.list();
	}
	
	// 게시글 작성
	@Override
	public void write(CommunityVO CommunityVO) throws Exception {
		mapper.write(CommunityVO);
	}
	@Override
	public void write(Integer cBoardId) throws Exception {
		mapper.write(cBoardId);
	}
	
	// 게시글 보기
	@Override
	 public CommunityVO view(Integer cBoardId) throws Exception {
		 return mapper.view(cBoardId);
	}
	
	// 게시글 삭제
	@Override
	public void remove(Integer cBoardId) throws Exception {
		mapper.remove(cBoardId);
	}
	
	// 게시글 수정
	@Override
	public void modify(CommunityVO CommunityVO) throws Exception {
		mapper.modify(CommunityVO);
	}
	 
	// 사용X
	 @Override
	 public List<CommunityVO> listCriteria(Criteria cri) throws Exception {
	 return mapper.listCriteria(cri);
	 }
	 @Override
	 public int listCountCriteria(Criteria cri) throws Exception {
	 return mapper.listCountCriteria(cri);
	 }
	 @Override
	 public List<CommunityVO> listSearchCriteria(SearchCriteria cri) throws Exception {
	 return mapper.listSearchCriteria(cri);
	 }
	 @Override
	 public int listSearchCount(SearchCriteria cri) throws Exception {
	 return mapper.listSearchCount(cri);
	 }
}
