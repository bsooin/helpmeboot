package org.helpme.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.helpme.domain.CommunityVO;
import org.helpme.domain.Criteria;
import org.helpme.domain.PageMaker;
import org.helpme.service.CommunityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	// 자동 DI 적용시키는 어노테이션 - Inject, Autowired
	@Autowired
	private CommunityService CommunityService;
	
	@Autowired
	private String uploadPath;
	
	// 게시글 작성
	@GetMapping("/write")
	public void registerGET(CommunityVO CommunityVO, Model model) throws Exception {
		logger.info("write get ..........");
	}
	
	@PostMapping("/write")
	public String registPOST(
			CommunityVO CommunityVO, @RequestParam(name = "attachFile", required = false) MultipartFile file,
			HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		logger.info("write post ...........");
		logger.info(CommunityVO.toString());
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		if (file != null && checkFile(file)) {
			CommunityVO.setcFileName(uploadFile(file.getOriginalFilename(), file.getBytes()));
		} else {
			CommunityVO.setcFileName("");
		}
		
		if(userId!=null) {
			CommunityVO.setUserId(userId);
		}else {
			CommunityVO.setUserId("userId1");
		}
		CommunityService.write(CommunityVO);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list";
	}
	
	
	// 게시판 리스트
	@GetMapping("/list")
	// 실행할 메서드
	// model 안에 request가 있다. model에 데이터를 저장하면 request에 저장된다.
	public String list(Model model) throws Exception {
		logger.info("show all list........");
		model.addAttribute("list", CommunityService.list());
		return "board/list";
	}
	
	
	// 게시글 보기
	
	@GetMapping("/view")
	public String view(
			@RequestParam("cBoardId") int cBoardId, 
			Model model) throws Exception {
		model.addAttribute("list", CommunityService.view(cBoardId));
		return "board/view";
	}
	
	 
	// 게시글 삭제
	
	@GetMapping("/remove")
	public String remove(
			@RequestParam("cBoardId") int cBoardId, 
			RedirectAttributes rttr) throws Exception {
		CommunityService.remove(cBoardId);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list";
	}
	
	
	// 게시글 수정
	
	@GetMapping("/modify")
		public void modifyGET(int cBoardId, Model model) throws Exception {
		model.addAttribute("list", CommunityService.view(cBoardId));
	}
	 
	@PostMapping("/modify")
	public String modifyPOST(
		CommunityVO CommunityVO,@RequestParam(name = "attachFile", required = false) MultipartFile file,
		RedirectAttributes rttr) throws Exception {
			logger.info("mod post............");
			if (file != null && checkFile(file)) {
				CommunityVO.setcFileName(uploadFile(file.getOriginalFilename(), file.getBytes()));
			} else {
				CommunityVO.setcFileName("");
			}
			CommunityService.modify(CommunityVO);
			rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/view?cBoardId=" + CommunityVO.getcBoardId();
	}
	 
	// 게시판 리스트
		@GetMapping("/faqlist")
		// 실행할 메서드
		// model 안에 request가 있다. model에 데이터를 저장하면 request에 저장된다.
		public String faqlist(Model model) throws Exception {
			logger.info("show all list........");
			model.addAttribute("faqlist", CommunityService.list());
			return "board/faqlist";
	} 
	
	@GetMapping("/reply")
	public void ajaxTest() {
		
	}


	 // 이건 사용 X

	@GetMapping("/viewPage")
	public void read(@RequestParam("cBoardId") int cBoardId, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		 model.addAttribute(CommunityService.view(cBoardId));
	}
	 
	 @PostMapping("/removePage")
		public String remove(@RequestParam("cBoardId") int cBoardId, Criteria cri, RedirectAttributes rttr) throws Exception {
			CommunityService.remove(cBoardId);
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/board/list";
		}
	 
	 @GetMapping("/modifyPage")
	 public void modifyPagingGET(@RequestParam("cBoardId") int cBoardId, @ModelAttribute("cri") Criteria cri, Model 
	model)
	 throws Exception {
	 model.addAttribute(CommunityService.view(cBoardId));
	 }
	 
	 
	 @GetMapping("/listCri")
	 public void listAll(Criteria cri, Model model) throws Exception {
	 logger.info("show list Page with Criteria......................");
	 model.addAttribute("list", CommunityService.listCriteria(cri));
	 }
	 @GetMapping("/listPage")
	 public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
	 logger.info(cri.toString());
	 model.addAttribute("list", CommunityService.listCriteria(cri));
	 PageMaker pageMaker = new PageMaker();
	 pageMaker.setCri(cri);
	 // pageMaker.setTotalCount(131);
	 pageMaker.setTotalCount(CommunityService.listCountCriteria(cri));
	 model.addAttribute("pageMaker", pageMaker);
	 }
	 
	 private boolean checkFile(MultipartFile m) {
			if(m.getOriginalFilename()==null||m.getOriginalFilename()=="") {
				return false;
			}else {
				if (m.getOriginalFilename().substring(m.getOriginalFilename().length() - 3).toUpperCase().equals("JPG")
						|| m.getOriginalFilename().substring(m.getOriginalFilename().length() - 3).toUpperCase().equals("JPEG")
						|| m.getOriginalFilename().substring(m.getOriginalFilename().length() - 3).toUpperCase().equals("GIF")
						|| m.getOriginalFilename().substring(m.getOriginalFilename().length() - 3).toUpperCase().equals("PNG"))
					return true;
				return false;
			}
			
		}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

			UUID uid = UUID.randomUUID();

			String savedName = uid.toString() + "_" + originalName;

			File target = new File(uploadPath, savedName);

			FileCopyUtils.copy(fileData, target);

			return savedName;

	}
	
	 
}
