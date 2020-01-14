package kh.picsell.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.picsell.dto.MemberDTO;
import kh.picsell.service.MyInfoService;

@Controller
@RequestMapping("/myInfo")
public class MyInfoController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private MyInfoService myInfoService;

	@RequestMapping("/myInfo.do")
	public String myInfo() {
		System.out.println("오냐?");
		String nickName = "이이이";
		MemberDTO memberDto = myInfoService.myInfo(nickName);
		memberDto.toString();
		System.out.println("ze");
		session.setAttribute("memberDto", memberDto);
		return "myPage/myPage";
	}
	
	@RequestMapping("/infoModifyProc.do")
	public void infoModifyProc(String id,MemberDTO memberDto) {
		memberDto.setId(id);
		myInfoService.infoModifyProc(memberDto);
	}
	
	@RequestMapping("/modiPage.do")
	public String modiPage() {
		String nickName = "이이이";
		MemberDTO memberDto = myInfoService.myInfo(nickName);
		session.setAttribute("memberDto", memberDto);
		return "myPage/modiPage";
	}
	
	@RequestMapping("/modifyPw.do")
	public String modifyPw() {
		return "myPage/modifyPw";
	}
	
	@RequestMapping(value="/currentPwCheck.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String currentPwCheck(String currentPw) {
		System.out.println("여기요");
		String nickName = "이이이";
		String pw = myInfoService.currentPwCheck(nickName);
		return pw;
	}
	
	@RequestMapping("/modifyPwProc.do")
	public String modifyPwProc(String pw) {
		String nickName = "이이이";
		myInfoService.modifyPwProc(pw, nickName);
		return "redirect:myInfo.do";
	}

	
}
