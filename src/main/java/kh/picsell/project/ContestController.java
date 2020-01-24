package kh.picsell.project;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dto.ContestDTO;
import kh.picsell.service.ContestService;
import kh.picsell.service.MoneyService;

@Controller
@RequestMapping("/contest")
public class ContestController {
   @Autowired
   private HttpSession session;

   @Autowired
   private ContestService service;
   
   @Autowired
   private MoneyService money;
   
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
	  try {
	 List<ContestDTO> list = service.enrollList(contest_seq);
	 ContestDTO dto = service.detailcheck(contest_seq);
	 System.out.println(dto.getHost());
	 request.setAttribute("list", list);
	 request.setAttribute("dto", dto);
	  }catch(Exception e) {
		  e.printStackTrace();
		  
	  }
	 return "contest/enrollimagelist";
 }
   
  
	//사진다운로드
	@RequestMapping("download")
	public void download(int contest_img_seq, String enroll_sysname, HttpServletResponse response, HttpServletRequest request) {
		System.out.println("도착?");
		try {
		request.setCharacterEncoding("UTF-8");
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		String path = session.getServletContext().getRealPath("contestenroll");

		String fullpath = path + "/" + enroll_sysname;
		File f = new File(fullpath);
		try(
				FileInputStream fis = new FileInputStream(f);
				DataInputStream fileDis = new DataInputStream(fis);
				){
			byte[] fileContents = new byte[(int)f.length()];
			fileDis.readFully(fileContents);

			response.reset();
			response.setContentType("application/octet-stream");
			String encFileName = new String(enroll_sysname.getBytes("utf8"),"iso-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + encFileName + "\""); 
			response.setHeader("Content-Length", String.valueOf(f.length()));
			ServletOutputStream sos = response.getOutputStream();
			sos.write(fileContents);
			sos.flush();
		}catch(Exception e) {
			e.printStackTrace();
		};

		
	}
   
	@RequestMapping(value="select")
   public String selectsuccess(int contest_seq, HttpServletRequest request) {
		try {
		List<ContestDTO> list = service.enrollList(contest_seq);
		String[] select = request.getParameterValues("select");

		service.contestProfit(contest_seq, select);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:enrollList?contest_seq="+contest_seq;


   }
	@RequestMapping(value="alreadyselect")
	@ResponseBody
	public List<ContestDTO> alreadyselected(int contest_seq) {
		 List<ContestDTO> selectedList = service.selected(contest_seq);
		 return selectedList;
	}
	
	@RequestMapping("enrolldetail")
	public String detail(int contest_img_seq, String title, HttpServletRequest request) {
		ContestDTO dto = service.enrollimagedetail(contest_img_seq);
		request.setAttribute("dto",dto);
		return "contest/enrollimagedetail";
	}
   
}