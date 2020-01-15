package kh.picsell.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		String nickName = (String)session.getAttribute("loginInfo");
		MemberDTO memberDto = myInfoService.myInfo(nickName);
		memberDto.toString();
		System.out.println("ze");
		session.setAttribute("memberDto", memberDto);
		return "myPage/myPage";
	}
	
	@RequestMapping("/infoModifyProc.do")
	public String infoModifyProc(String id,MemberDTO memberDto) {
		System.out.println(id);
		memberDto.setId(id);
		myInfoService.infoModifyProc(memberDto);
		session.removeAttribute("loginInfo");
		return "home";
	}
	
	@RequestMapping("/modiPage.do")
	public String modiPage() {
		String nickName = (String)session.getAttribute("loginInfo");
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
		String nickName = (String)session.getAttribute("loginInfo");
		String pw = myInfoService.currentPwCheck(nickName);
		return pw;
	}
	
	@RequestMapping("/modifyPwProc.do")
	public String modifyPwProc(String pw) {
		String nickName = (String)session.getAttribute("loginInfo");
		myInfoService.modifyPwProc(pw, nickName);
		session.removeAttribute("loginInfo");
		return "home";
	}
	
//	@RequestMapping("/modifyInfo.do")
//	public void modifyInfo(MemberDTO dto) {
//		String nick = (String)session.getAttribute("loginInfo");
//		myInfoService.modifyInfo(nick, dto);
//
//	}
	@RequestMapping(value="profileimg", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String modiprofileimg(MultipartFile file, String nickname) {
		System.out.println("오니");
		System.out.println(nickname);
		System.out.println(file);
		String path = session.getServletContext().getRealPath("profileimage");
		String url = myInfoService.modiprofileimg(file, path, nickname);
		System.out.println(url);
		return url; 
	}
	
}
