package org.helpme.service;

import lombok.AllArgsConstructor;
import org.helpme.domain.AccountInfoVO;
import org.helpme.domain.MemberVO;
import org.helpme.domain.ServiceVO;
import org.helpme.dto.LoginDTO;
import org.helpme.dto.ReviewDTO;
import org.helpme.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@Service
//@Configuration
//@MapperScan("org.yuni.mapper")
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	private JavaMailSender mailSender;


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

		String msg = "";

		String subject = "HELP ME 임시 비밀번호 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += vo.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += vo.getUserPw() + "</p></div>";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(vo.getUserEmail());
		message.setFrom("teacher923@naver.com");
		message.setSubject(subject);
		message.setText(msg);

		mailSender.send(message);

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