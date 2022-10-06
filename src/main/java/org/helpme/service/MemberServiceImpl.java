package org.helpme.service;

import org.apache.commons.mail.HtmlEmail;
import org.helpme.domain.AccountInfoVO;
import org.helpme.domain.MemberVO;
import org.helpme.domain.ServiceVO;
import org.helpme.dto.LoginDTO;
import org.helpme.dto.ReviewDTO;
import org.helpme.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@Service
//@Configuration
//@MapperScan("org.yuni.mapper")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {

		return memberMapper.login(dto);
	}

	@Override
	public void keepLogin(String userId, String sessionId, Date next) throws Exception {

		memberMapper.keepLogin(userId, sessionId, next);

	}

	
	  @Override 
	  public int idCheck(String userId) throws Exception{
	        return memberMapper.idCheck(userId);
	}
	
	
	@Override
	public void create(MemberVO member) throws Exception {
		memberMapper.create(member);

	}

	@Override
	public void update(MemberVO member) throws Exception {
		memberMapper.update(member);

	}

	@Override
	public MemberVO selectOne(String userId) throws Exception {

		return memberMapper.selectOne(userId);
	}

	@Override
	public void delete(String userId) throws Exception {
		memberMapper.delete(userId);

	}
	
	@Override
	public String pwCheck(String userId) throws Exception{
		return memberMapper.pwCheck(userId);
	}
	
	@Override
	public void changePwd(String userId, String userPw) throws Exception{
		memberMapper.changePwd(userId, userPw);
	}
	
	// index 메인 
		@Override
		public List<ReviewDTO> bestHelper() throws Exception{
			return memberMapper.bestHelper();
		}

		@Override
		public List<ServiceVO> newHelper() throws Exception {
			return memberMapper.newHelper();
		}

		@Override
		public List<ReviewDTO> mainReview() throws Exception {
			return memberMapper.mainReview();
		}

		// 계좌 정보 입력 
		@Override
		public void accountCreate(AccountInfoVO account) throws Exception {
			memberMapper.accountCreate(account);
			
		}
		// 계좌 정보 조회
		@Override
		public AccountInfoVO selectAccount(String userId) throws Exception {
			return memberMapper.selectAccount(userId);
		}
		// 계좌 정보 수정
		@Override
		public void updateAccount(AccountInfoVO account) throws Exception {
			memberMapper.updateAccount(account);
		}

		//비밀번호 찾기 이메일발송
		@Override
		public void sendEmail(MemberVO vo, String div) throws Exception {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com"; //지메일 이용시 smtp.gmail.com
			String hostSMTPid = "아이디";
			String hostSMTPpwd = "비밀번호";
			// 네이버 환경설정 하기
			
			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "보내는 사람아이디";
			String fromName = "보내는이";
			String subject = "";
			String msg = "";

			if(div.equals("findpw")) {
				subject = "HELP ME 임시 비밀번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += vo.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
				msg += "<p>임시 비밀번호 : ";
				msg += vo.getUserPw() + "</p></div>";
			}

			// 받는 사람 E-Mail 주소
			String mail = vo.getUserEmail();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				// email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(465); //네이버 이용시 587

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				// email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}

		//비밀번호찾기
		@Override
		public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			MemberVO ck = memberMapper.selectOne(vo.getUserId());
			PrintWriter out = response.getWriter();
			// 가입된 아이디가 없으면
			if(memberMapper.idCheck(vo.getUserId()) == 0) {
				out.print("등록되지 않은 아이디입니다.");
				out.close();
			}
			// 가입된 이메일이 아니면
			else if(!vo.getUserEmail().equals(ck.getUserEmail())) {
				out.print("등록되지 않은 이메일입니다.");
				out.close();
			}else {
				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				vo.setUserPw(pw);
				// 비밀번호 변경
				memberMapper.changePwd(vo.getUserId(),vo.getUserPw());
				// 비밀번호 변경 메일 발송
				sendEmail(vo, "findpw");

				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
			}
		}

		@Override
		public boolean getAccount(AccountInfoVO accountVO) {
			if(memberMapper.getAccount(accountVO)!=0)
				return true;
			return false;
		}
		
}
