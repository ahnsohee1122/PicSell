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
//	@Autowired
//	private HttpServletRequest request;
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
			session.setAttribute("ok", ok);
			session.setAttribute("no", no);
			session.setAttribute("notyet", notyet);
			list = service.contestchecking(host);
			request.setAttribute("list", list);
			return "myPage/contestaccpet";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}

 //공모전신청 
	@RequestMapping("newcontestform")
	public String newContestform(MultipartFile[] files, ContestDTO dto) {
		String path = session.getServletContext().getRealPath("contestfiles");
		//String nickname = (String)session.getAttribute("loginInfo");
		String nickname = "hello";
		service.newcontest(files, dto, path, nickname);
		return "redirect:contest.do";
	}
	
	
	
	
	
	
	
	
}