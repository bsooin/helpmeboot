package org.helpme.service;

import org.helpme.domain.Criteria;
import org.helpme.domain.ReplyVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ReplyService {
	
	// 댓글 리스트
	public List<ReplyVO> replylist(Integer cBoardId) throws Exception;
	// 댓글 작성
	public void replywrite(ReplyVO ReplyVO) throws Exception;
	public void replywrite(Integer cBoardId) throws Exception;
	// 댓글 삭제
	public void replyremove(Integer replyNo) throws Exception;
	// 댓글 수정
	public void replymodify(ReplyVO ReplyVO) throws Exception;
	// 댓글 리스트 페이지
	public List<ReplyVO> replylistpage(Integer cBoardId, Criteria cri) throws Exception;
	// 댓글 카운트
	public int replycount(Integer cBoardId) throws Exception;
}
