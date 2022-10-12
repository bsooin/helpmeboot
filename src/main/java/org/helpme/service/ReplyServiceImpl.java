package org.helpme.service;

import org.helpme.domain.Criteria;
import org.helpme.domain.ReplyVO;
import org.helpme.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;
	// mapper ver
	
	@Override
	public List<ReplyVO> replylist(Integer cBoardId) throws Exception{
		return mapper.replylist(cBoardId);
	}
	
	@Override
	public void replywrite(ReplyVO ReplyVO) throws Exception {
		mapper.replywrite(ReplyVO);
	}
	
	@Override
	public void replywrite(Integer cBoardId) throws Exception {
		mapper.replywrite(cBoardId);
	}
	
	@Override
	public void replymodify(ReplyVO ReplyVO) throws Exception {
		mapper.replymodify(ReplyVO);
	}
	
	@Override
	public void replyremove(Integer replyNo) throws Exception {
		mapper.replyremove(replyNo);
	}
	
	@Override
	public List<ReplyVO> replylistpage(Integer cBoardId, Criteria cri) throws Exception{
		return mapper.replylistpage(cBoardId, cri);
	}
	
	@Override
	public int replycount(Integer cBoardId) throws Exception {
		return mapper.replycount(cBoardId);
	}
	
}
