package org.helpme.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.helpme.domain.*;
import org.helpme.service.MypageService;
import org.helpme.service.ServiceService;
import org.helpme.util.MediaUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequiredArgsConstructor
@Slf4j
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	// 이미지 가져오기
	@Value("uploadPath")
	private String uploadPath;

	private MypageService service;

	/*
	 * 거래내역 보기 최근 본 서비스 내가 쓴 후기 1:1 문의 내역 보기 찜 목록 차단 목록 신고 목록 적립금 조회
	 */

	// 회원 정보 조회 


	@GetMapping("/mypage") public String
  modify(HttpServletRequest request, Model model,HttpSession session) throws Exception {

  
	  MemberVO login = (MemberVO) request.getSession().getAttribute("member");
		if (login != null) {
			String userId = login.getUserId();
			session = request.getSession();	
			MemberVO memberVO = service.selectId(userId);
			model.addAttribute("member", memberVO);
			
			PointVO pointVO = service.selectMyPoint(userId);
			model.addAttribute("point", pointVO);

			return "/my/mypage";
		}
		else {
			model.addAttribute("member", null);
			model.addAttribute("point", null);
			return "/my/mypage";
		}

		
  }


	// 거래 내역 보기 -페이징

	@GetMapping("/mydeal")
	public void mydeal(@ModelAttribute("cri") MypageCriteria cri, HttpServletRequest request,Model model)
			throws Exception {

		logger.info(cri.toString());
		
		MemberVO login = (MemberVO) request.getSession().getAttribute("member");

		if (login != null) {
			String userId = login.getUserId();
		List<?> deal = service.listCriteria(userId);
		model.addAttribute("deal", deal);

		MypagePageMaker pageMaker = new MypagePageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		}else {
			model.addAttribute("member", null);
		}

	}

	// 리뷰 페이징
	@GetMapping("/myreview")
	public void myreview(@ModelAttribute("cri") MypageCriteria cri, HttpServletRequest request,Model model)
			throws Exception {
		logger.info(cri.toString());
		
		MemberVO login = (MemberVO) request.getSession().getAttribute("member");
		
		if (login != null) {
			String userId = login.getUserId();
		
		List<?> review = service.listReviewCriteria(userId);
		model.addAttribute("review", review);

		MypagePageMaker pageMaker = new MypagePageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listReviewSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		ServiceService serviceS;
		
		
		}else {
			model.addAttribute("member", null);
		}

	}

	// 이미지 가져오기
	@ResponseBody
	@RequestMapping("/mydisplayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("FILE NAME: " + fileName);

		try {

			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + "/" + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {

				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			System.out.println("entity=" + entity);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	// 찜 목록 페이징
	@GetMapping("/likelist")
	public void likelist(@ModelAttribute("cri") MypageCriteria cri, HttpServletRequest request,Model model)
			throws Exception {
		logger.info(cri.toString());
		
		MemberVO login = (MemberVO) request.getSession().getAttribute("member");
		
		if (login != null) {
		
			String userId = login.getUserId();
		List<?> likelist = service.listLikeCriteria(userId);
		model.addAttribute("like", likelist);

		MypagePageMaker pageMaker = new MypagePageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listLikeSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		}else {
			model.addAttribute("member", null);
		}

	}

	// 적립금 조회
	@GetMapping("/mypoint")
	public void mypoint(HttpServletRequest request, Model model) throws Exception {
		
		MemberVO login = (MemberVO) request.getSession().getAttribute("member");
		String userId = login.getUserId();
		
		PointVO pointVO = service.selectMyPoint(userId);
		model.addAttribute("point", pointVO);

	}

	// 최근 본 서비스

	@GetMapping("/latestservice")
	public void latestservice(@ModelAttribute("cri") MypageCriteria cri,HttpServletRequest request, Model model) throws Exception {

		MemberVO login = (MemberVO) request.getSession().getAttribute("member");
		
		if (login != null) {
			String userId = login.getUserId();
		try {
			ArrayList<Integer> list = (ArrayList)request.getSession().getAttribute("sNo");
			ArrayList<ServiceVO> result = null;
			if(list!=null) {
				result = new ArrayList<>();
				for(Integer i: list) {
					ServiceVO serviceOne = service.listLatestCriteria(i);
					result.add(serviceOne);
				}
			}
			
			model.addAttribute("list", result);

			MypagePageMaker pageMaker = new MypagePageMaker();
			pageMaker.setCri(cri);

			pageMaker.setTotalCount(service.listLatestSearchCount(cri));

			model.addAttribute("pageMaker", pageMaker);
			
			
			MemberVO memberVO = service.selectId(userId);
			model.addAttribute("member", memberVO);


		} catch (Exception e) {
			List<?> list = null;
			model.addAttribute("list", list);

		}
		}else {
			model.addAttribute("member", null);
		}

		
		
		
	}

}
