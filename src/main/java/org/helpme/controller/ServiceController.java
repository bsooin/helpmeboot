package org.helpme.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.helpme.domain.PageMaker;
import org.helpme.domain.SearchCriteria;
import org.helpme.domain.ServiceVO;
import org.helpme.dto.DealDTO;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@Slf4j
@SuppressWarnings("unchecked")
@RequestMapping("/service/*")
public class ServiceController {

    private static final Logger logger = LoggerFactory.getLogger(ServiceController.class);

    private final String uploadPath = "C:\\team2";

    private final ServiceService serviceS;

    @GetMapping("/list")
    public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
        System.out.println("keyword=" + cri.getKeyword());
        model.addAttribute("list", serviceS.listSearchCriteria(cri));


        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);

        pageMaker.setTotalCount(serviceS.listSearchCount(cri));

        model.addAttribute("pageMaker", pageMaker);
    }


    @GetMapping("/detail")
    public void read(@RequestParam("sNo") int sNo, @ModelAttribute("cri") SearchCriteria cri, Model model,
                     HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        String logIn = (String) session.getAttribute("userId");

        model.addAttribute("service", serviceS.read(sNo));
//		model.addAttribute("logIn", null);

        boolean completeCheck = false;
        if (logIn != null) {
            completeCheck = serviceS.purchaseCheck(sNo, logIn);
        }

        model.addAttribute("completeId", completeCheck);
        model.addAttribute("serviceAttach", serviceS.getAttach(sNo));

        boolean likeIt = true;

        // 최근 본 서비스 HttpServletRequest도 추가 - 윤희
        if (logIn != null) {
            ArrayList<Integer> sNoList = (ArrayList<Integer>) session.getAttribute("sNo");
            boolean check = true;

            if (sNoList == null) {
                sNoList = new ArrayList<Integer>();
            } else {
                check = !sNoList.contains(sNo);
            }

            if (check) {
                if (sNoList.size() == 8) {
                    sNoList.remove(0);
                    sNoList.add(sNo);
                } else {
                    sNoList.add(sNo);
                }
            }
            session.setAttribute("sNo", sNoList);

            likeIt = serviceS.likeServiceCheck(logIn, sNo);
        }

        model.addAttribute("likeService", likeIt);
        session.setAttribute("currentsNo", sNo);


    }

    @GetMapping("/remove")
    public String remove(@RequestParam("sNo") int sNo, RedirectAttributes rttr) throws Exception {

        deleteFile(serviceS.read(sNo).getSAttach());
        String[] serviceAttach = serviceS.getAttach(sNo);
        if (serviceAttach != null && serviceAttach.length != 0) {
            for (String s : serviceAttach)
                deleteDetailFile(s);
        }
        serviceS.remove(sNo);
        serviceS.deleteDetail(sNo);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/service/list";
    }

    @GetMapping("/modifyForm")
    public void modifyPagingGET(@RequestParam("sNo") int sNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
            throws Exception {

        model.addAttribute("service", serviceS.read(sNo));
        model.addAttribute("serviceAttach", serviceS.getAttach(sNo));
    }

    @PostMapping("/modifyForm")
    public String modifyPagingPOST(ServiceVO service,
                                   @RequestParam(name = "attachFile", required = false) MultipartFile file,
                                   @RequestParam(name = "detailFile", required = false) List<MultipartFile> detailFile,
                                   RedirectAttributes rttr) throws Exception {

        if (!file.getOriginalFilename().equals("") && checkFile(file)) {
            String serviceFileName = serviceS.read(service.getSNo()).getSAttach();

            deleteFile(serviceFileName);
            service.setSAttach(uploadFile(file.getOriginalFilename(), file.getBytes()));

        }

        boolean detailCheck = detailFile.get(0).getOriginalFilename() != null
                && detailFile.get(0).getOriginalFilename() != "";

        if (detailCheck) {
            String[] serviceAttach = serviceS.getAttach(service.getSNo());
            if (serviceAttach != null && serviceAttach.length != 0) {
                for (String s : serviceAttach)
                    deleteDetailFile(s);
            }
            serviceS.deleteDetail(service.getSNo());
            for (MultipartFile m : detailFile) {

                if (!file.getOriginalFilename().equals("") && checkFile(file))
                    serviceS.detailAttach(service.getSNo(), uploadDetailFile(m.getOriginalFilename(), m.getBytes()));
            }

        }

        service.setSRegdate(new Date());

        serviceS.modify(service);

        rttr.addFlashAttribute("msg", "SUCCESS");

        logger.info(rttr.toString());

        return "redirect:/service/detail?sNo=" + service.getSNo();
    }

    @GetMapping("/newService")
    public void registGET(HttpSession session, Model model) throws Exception {


//		logger.info("regist get ...........");
//
//		Object obj = session.getAttribute("login");
//		model.addAttribute("logIn", obj);

    }

    @PostMapping("/newService")
    public String registPOST(ServiceVO service, @RequestParam(name = "attachFile", required = false) MultipartFile file,
                             @RequestParam(name = "detailFile", required = false) List<MultipartFile> detailFile,
                             RedirectAttributes rttr, HttpServletRequest request) throws Exception {

        logger.info("regist post ...........");
        logger.info(service.toString());

        if (!file.getOriginalFilename().equals("") && checkFile(file)) {
            service.setSAttach(uploadFile(file.getOriginalFilename(), file.getBytes()));
        } else {
            service.setSAttach("basic.jpg");
        }

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        service.setUserId(userId);
        service.setSRegdate(new Date());
        serviceS.regist(service);

        for (MultipartFile m : detailFile) {
            if (!file.getOriginalFilename().equals("") && checkFile(file)) {
                serviceS.detailAttach(serviceS.getLastSNo(), uploadDetailFile(m.getOriginalFilename(), m.getBytes()));
            }
        }

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/service/list";
    }

    @PutMapping("/{sNo}")
    @PatchMapping("/{sNo}")
    public ResponseEntity<String> likeIt(@PathVariable("sNo") Integer sNo, HttpServletRequest request)
            throws Exception {
        ResponseEntity<String> entity = null;

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        try {
            if (userId != null) {
                if (!serviceS.likeCheck(sNo, userId)) {
                    serviceS.likeIt(sNo, userId);
                    entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    @PostMapping("/{sNo}/{price}")
    public ResponseEntity<String> purchase(@PathVariable("sNo") Integer sNo, @PathVariable("price") Integer price,
                                           HttpServletRequest request) throws Exception {

        ResponseEntity<String> entity = null;

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        try {
            if (!serviceS.purchaseCheck(sNo, userId)) {
                DealDTO deal = new DealDTO();
                deal.setsNo(sNo);
                deal.setdPrice(price);
                deal.setdDate(new Date());
                deal.setUserId(userId);
                serviceS.purchase(deal);
                entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
            }

        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    @ResponseBody
    @GetMapping("/displayFile")
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

    @ResponseBody
    @GetMapping("/displayAttach")
    public ResponseEntity<byte[]> displayAttach(String fileName) throws Exception {

        InputStream in = null;
        ResponseEntity<byte[]> entity = null;

        logger.info("FILE NAME: " + fileName);

        try {


            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);


            MediaType mType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();


            in = new FileInputStream(uploadPath + "/detail/" + fileName);

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


    private String uploadFile(String originalName, byte[] fileData) throws Exception {

        UUID uid = UUID.randomUUID();

        String savedName = uid.toString() + "_" + originalName;

        File target = new File(uploadPath, savedName);

        FileCopyUtils.copy(fileData, target);

        return savedName;

    }

    private String uploadDetailFile(String originalName, byte[] fileData) throws Exception {

        UUID uid = UUID.randomUUID();

        String savedName = uid.toString() + "_" + originalName;

        File target = new File(uploadPath + "\\detail", savedName);

        FileCopyUtils.copy(fileData, target);

        return savedName;

    }

    private void deleteFile(String fileName) {
        if (!fileName.equals("basic.jpg"))
            new File(uploadPath + "\\" + fileName).delete();
    }

    private void deleteDetailFile(String fileName) {

        new File(uploadPath + "\\detail\\" + fileName).delete();
    }

    private boolean checkFile(MultipartFile m) {
        if (m.getOriginalFilename() == null || m.getOriginalFilename() == "") {
            return false;
        } else {
            if (m.getOriginalFilename().substring(m.getOriginalFilename().length() - 3).toUpperCase().equals("JPG")
                    || m.getOriginalFilename().substring(m.getOriginalFilename().length() - 3).toUpperCase().equals("JPEG")
                    || m.getOriginalFilename().substring(m.getOriginalFilename().length() - 3).toUpperCase().equals("GIF")
                    || m.getOriginalFilename().substring(m.getOriginalFilename().length() - 3).toUpperCase().equals("PNG"))
                return true;
            return false;
        }

    }

    // 카카오페이 결제
    @GetMapping("/kakaopay")
    @ResponseBody
    public String kakaopay(HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        Integer sNo = (Integer) session.getAttribute("currentsNo");

        ServiceVO service = serviceS.read(sNo); // 임시로 지정
        String itemName = service.getSName();
        String order_id = service.getSNo() + itemName;

        String userId = (String) session.getAttribute("userId");

        int totalAmount = service.getPrice();
        int vat = (int) totalAmount * 10;


        try {
            // 보내는 부분
            URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
            HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Authorization", "KakaoAK a20c2086f2478cc2e8ce8c7456f78a55"); // 어드민 키
            connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지

            String parameter = "cid=TC0ONETIME" // 가맹점 코드
                    + "&partner_order_id=" + order_id// 가맹점 주문번호
                    + "&partner_user_id=" + userId// 가맹점 회원 id
                    + "&item_name=" + URLEncoder.encode(itemName, "utf-8") // 상품명
                    + "&quantity=1" // 상품 수량
                    + "&total_amount=" + totalAmount // 총 금액
                    + "&vat_amount=0" // 부가세
                    + "&tax_free_amount=0" // 상품 비과세 금액
                    + "&approval_url=http://localhost:8080/my/mydeal" // 결제 성공 시
                    + "&fail_url=http://localhost:8080/my/mydeal" // 결제 실패 시
                    + "&cancel_url=http://localhost:8080/main/index"; // 결제 취소 시
            OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
            DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
            dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
            dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)

            int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
            InputStream receive; // 받다

            if (result == 200) {
                receive = connection.getInputStream();
            } else {
                receive = connection.getErrorStream();
            }
            // 읽는 부분
            InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
            BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
            // 받는 부분
            return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    @PutMapping("/likeService/{sNo}/{checkNum}")
    @PatchMapping("/likeService/{sNo}/{checkNum}")
    public ResponseEntity<String> likeService(@PathVariable("sNo") Integer sNo,
                                              @PathVariable("checkNum") Integer checkNum, HttpServletRequest request)
            throws Exception {

        ResponseEntity<String> entity = null;

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        try {
            if (userId != null) {
                if (checkNum != 0) {
                    serviceS.likeService(userId, sNo);
                } else {
                    serviceS.deleteLikeService(userId, sNo);
                }
                entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
            }
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }



}
