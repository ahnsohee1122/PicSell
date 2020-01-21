package kh.picsell.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dto.ContestDTO;
import kh.picsell.service.ContestService;

@Controller
@RequestMapping("/contest")
public class ContestController {
   @Autowired
   private HttpSession session;

   @Autowired
   private ContestService service;
   
   // 공모전 페이지
   @RequestMapping("/contest.do")
   public String contest(HttpServletRequest request) {
      List<ContestDTO> list;
      try {
         list = service.acceptList();
         request.setAttribute("list", list);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return "contest/contest";
   }
   
   // 새로운 공모전 열기
   @RequestMapping("/newOpen.do")
   public String newOpen() {
      System.out.println("New Contest Open Page");
      return "contest/newOpen";
   }
   
   @RequestMapping("/check.do")
   public String check(ContestDTO dto, HttpServletRequest request) {
      List<ContestDTO> list;
      try {
         list = service.notyetList();
         request.setAttribute("list", list);
      }catch (Exception e) {
         e.printStackTrace();
      }
      return "contest/checking";
      
   }@RequestMapping("/detailcheck.do")
   public String detailcheck(int contest_seq, HttpServletRequest request) {
      ContestDTO dto = null;
      try {
         dto = service.detailcheck(contest_seq);
         List<ContestDTO> imglist = service.exampleimg(contest_seq);
         request.setAttribute("imglist", imglist);
         request.setAttribute("dto", dto);
         return "contest/detailcheck";
      }catch(Exception e) {
         e.printStackTrace();
         return "error";
      }
   }
   @RequestMapping(value="/accept.do", produces="text/html; charset=UTF-8")
   @ResponseBody
   public String accept(String accept_date, int contest_seq, HttpServletRequest request) {
	   System.out.println("공모전 :" + contest_seq);
      try{
         int result = service.accept(accept_date, contest_seq);
         if(result>0) {
            return "승인";
         }else {
            return"미승인";
         }
      }catch(Exception e) {
         e.printStackTrace();
         return "서버";
      }
   }
   @RequestMapping(value="/acceptno.do", produces="text/html; charset=UTF-8")
   @ResponseBody
   public String acceptno(String rejection, int contest_seq, HttpServletRequest request) {
      try{
         int result = service.noaccept(rejection, contest_seq);
         if(result>0) {
            return "거절";
         }else {
            return"취소";
         }
      }catch(Exception e) {
         e.printStackTrace();
         return "서버";
      }
   }
   
   @RequestMapping("/contestchecking.do")
   public String contestchecking(String host, HttpServletRequest request) {
      
      String host1 = (String)session.getAttribute("loginInfo");
      host=host1;
      int ok = 0;
      int no = 0;
      int notyet = 0;
      List<ContestDTO> list;
      try {
         ok = service.showok(host);
         no = service.showno(host);
         notyet = service.notyet(host);
         request.setAttribute("ok", ok);
         request.setAttribute("no", no);
         request.setAttribute("notyet", notyet);
         list = service.contestchecking(host);
         request.setAttribute("list", list);
         return "myPage/contestaccept";
      }catch(Exception e) {
         e.printStackTrace();
         return "error";
      }
      
   }

   //공모전신청 
   @RequestMapping("newcontestform")
   public String newContestform(MultipartFile[] files, ContestDTO dto) {
      String path = session.getServletContext().getRealPath("contestfiles");
      String nickname = (String)session.getAttribute("loginInfo");
      service.newcontest(files, dto, path, nickname);
      return "redirect:contest.do";

   }
   
  @RequestMapping("detail")
   public String detail(ContestDTO dto, HttpServletRequest request) {
	  try {
	  ContestDTO contestDto = service.detailcheck(dto.getContest_seq());
	  List<ContestDTO> imglist = service.exampleimg(dto.getContest_seq());
	  request.setAttribute("contestDto", contestDto);
	  request.setAttribute("imglist", imglist);
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	   return "contest/contestdetail";
   }
  
  @RequestMapping("upload")
  public String contestupload(ContestDTO dto, HttpServletRequest request) {
	  request.setAttribute("title", dto.getTitle());
	  request.setAttribute("contest_seq", dto.getContest_seq());
	  return "contest/imageupload";
  }
  
  //이미지 업로드
  @RequestMapping("enroll")
  public String imageupload(MultipartFile[] files, ContestDTO dto,HttpServletRequest request) {
	  try {
	  String contestpath = session.getServletContext().getRealPath("contestenroll");
	  String nickname = (String)session.getAttribute("loginInfo");
	  dto.setEnroll_nickname(nickname);
	  service.enrollimg(files, dto, contestpath);
	  ContestDTO contestDto = service.detailcheck(dto.getContest_seq());
	  List<ContestDTO> imglist = service.exampleimg(dto.getContest_seq());
	  request.setAttribute("contestDto", contestDto);
	  request.setAttribute("imglist", imglist);
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return "contest/contestdetail";
  }
   
  //출품한리스트보기
  @RequestMapping("enrollList")
 public String enrollList(int contest_seq, HttpServletRequest request) {
	 List<ContestDTO> list = service.enrollList(contest_seq);
	 request.setAttribute("list", list);
	 return "contest/enrollimagelist";
 }
   
   
   
   
}