package kh.picsell.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		String nickName = "오리에";
		MemberDTO memberDto = myInfoService.myInfo(nickName);
		session.setAttribute("memberDto", memberDto);
		return "myPage/myPage";
	}
	
	@RequestMapping("/infoModify.do")
	public String infoModify() {
		String nickName = "오리에";
		MemberDTO memberDto = myInfoService.myInfo(nickName);
		session.setAttribute("memberDto", memberDto);
		return "myPage/infoModify";
	}
	
	@RequestMapping("/infoModifyProc.do")
	public void infoModifyProc(String id,MemberDTO memberDto) {
		memberDto.setId(id);
		myInfoService.infoModifyProc(memberDto);
	}
}
