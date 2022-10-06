package org.helpme.service;

import org.helpme.domain.AccountInfoVO;
import org.helpme.domain.MemberVO;
import org.helpme.domain.ServiceVO;
import org.helpme.dto.LoginDTO;
import org.helpme.dto.ReviewDTO;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

public interface MemberService {
	public MemberVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String userId, String sessionId, Date next) throws Exception;
	
	int idCheck(String userId) throws Exception;

	public void create(MemberVO member) throws Exception;

	public void update(MemberVO member) throws Exception;

	public void delete(String userId) throws Exception;
	
   public String pwCheck(String userId)throws Exception;
	
	public void changePwd(String userId, String userPw) throws Exception;
	
	public MemberVO selectOne(String userId) throws Exception;
	
	// index 메인 
	List<ReviewDTO> bestHelper() throws Exception;
	
	List<ServiceVO> newHelper() throws Exception;
	
	List<ReviewDTO> mainReview() throws Exception;
	
	// 계좌 정보 입력 
	public void accountCreate(AccountInfoVO account) throws Exception;
	// 계좌 조회
	public AccountInfoVO selectAccount(String userId) throws Exception;
	// 계좌 정보 수정
	public void updateAccount(AccountInfoVO account) throws Exception;

	public void sendEmail(MemberVO member, String div) throws Exception;
	public void findPw(HttpServletResponse response, MemberVO member) throws Exception;

	public boolean getAccount(AccountInfoVO accountVO);

}
