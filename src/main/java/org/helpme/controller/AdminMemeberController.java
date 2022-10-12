package org.helpme.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.helpme.domain.MemberVO;
import org.helpme.service.AdminMemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/admin/*")
public class AdminMemeberController {

	private static final Logger logger = LoggerFactory.getLogger(AdminMemeberController.class);


	private final AdminMemberService adminMemberService;

	// 관리자 화면

	@GetMapping("/index")
	public void getIndex() throws Exception {
		logger.info("/index");
	}

	// 01. 회원목록보기
	@GetMapping("/memberList" )
	public void getMemberList(Model model) throws Exception {
		logger.info("get member list");
		//	logger.info(cri.toString());

		List<MemberVO> list = adminMemberService.memberList();

		//	model.addAttribute("list", adminMemberService.listSearchCriteria(cri));
		model.addAttribute("list",list);  // 변수 list의 값을 list 세션에 부여

		//	  PageMaker pageMaker = new PageMaker();
		//	    pageMaker.setCri(cri);

		// pageMaker.setTotalCount(service.listCountCriteria(cri));
		//    pageMaker.setTotalCount(adminMemberService.listSearchCount(cri));

		//    model.addAttribute("pageMaker", pageMaker);

	}

	//03. 회원 상세 조회하기

	@GetMapping("/memberView")
	public void viewMember (@RequestParam("userId") String userId,Model model) throws Exception {
		logger.info("get member view");

		MemberVO member = adminMemberService.viewMember(userId);
		model.addAttribute("member", member);

	}


	//04. 회원 정보 수정하기
	@GetMapping("/updateMember")
	public void getUpdateMember(@RequestParam("userId") String userId, Model model) throws Exception {
		// @RequestParam("id")으로 인해, URL주소에 있는 id의 값을 가져와 저장

		logger.info("get member update");

		MemberVO member = adminMemberService.viewMember(userId);
		model.addAttribute("member", member);

	}


	@PostMapping("/updateMember")
	public String  updateMemberPOST(MemberVO vo , HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post member modify");

		vo.setUserId(vo.getUserId().substring(0,vo.getUserId().indexOf(",")));

		adminMemberService.updateMember(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/memberList";

	}

	//05. 회원 정보 삭제하기

	@GetMapping("/deleteMember")
	public String deleteMember(@RequestParam("userId") String userId, RedirectAttributes rttr) throws Exception {
		// @RequestParam("id")으로 인해, URL주소에 있는 id의 값을 가져와 userId에 저장

		logger.info("post member delete");

		adminMemberService.deleteMember(userId);
		rttr.addFlashAttribute("msg", "SUCCESS");


		return "redirect:/admin/memberList";
	}
}