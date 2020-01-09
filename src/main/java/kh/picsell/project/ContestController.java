package kh.picsell.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String contest() {
		System.out.println("Contest Page");
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
		
	}@RequestMapping("/detailcheck")
	public String detailcheck(int contest_seq, HttpServletRequest request) {
		ContestDTO dto = null;
		try {
			dto = service.detailcheck(contest_seq);
			request.setAttribute("dto", dto);
			return "contest/detailcheck";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	@RequestMapping(value="/accept.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String accept(int contest_seq, HttpServletRequest request) {
		try{
			int result = service.accept(contest_seq);
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
	public String acceptno(int contest_seq, HttpServletRequest request) {
		try{
			int result = service.noaccept(contest_seq);
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
}
