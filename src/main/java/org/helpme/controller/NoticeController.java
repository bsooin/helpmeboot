package org.helpme.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.helpme.domain.NoticeVO;
import org.helpme.domain.PageMaker;
import org.helpme.domain.SearchCriteria;
import org.helpme.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);


	private NoticeService service;

	@GetMapping("/list")
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		// model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		// pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@GetMapping("/read")
	public void read(@RequestParam("noticeId") int noticeId, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		model.addAttribute(service.read(noticeId));
	}


	@GetMapping("/remove")
	public String remove(@RequestParam("noticeId") int noticeId, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		service.remove(noticeId);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/notice/list";
	}

	@GetMapping("/modify")
	public void modifyGET(int noticeId,@ModelAttribute("cri") SearchCriteria cri,  Model model) throws Exception {

		model.addAttribute(service.read(noticeId));
	}

	@PostMapping("/modify")
	public String modifyPOST(NoticeVO notice,  SearchCriteria cri, RedirectAttributes rttr) throws Exception {


		logger.info(cri.toString());
		service.modify(notice);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());

		return "redirect:/notice/list";
	}

	@GetMapping("/register")
	public void registGET() throws Exception {

		logger.info("regist get ...........");
	}

	@PostMapping("/register")
	public String registPOST(NoticeVO notice, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(notice.toString());

		service.create(notice);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/notice/list";
	}

}
