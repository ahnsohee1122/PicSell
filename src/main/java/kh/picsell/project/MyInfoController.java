package kh.picsell.project;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dto.MemberDTO;
import kh.picsell.service.MyInfoService;
import kh.picsell.service.WriterpageService;

@Controller
@RequestMapping("/myInfo")
public class MyInfoController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private MyInfoService myInfoService;
	
	@Autowired
	private WriterpageService writerservice;
	
	@RequestMapping("/myInfo.do")
	public String myInfo(HttpServletRequest request) {
		System.out.println("오냐?");
		String nickName = (String)session.getAttribute("loginInfo");
		Map<String,Integer> imginfo = writerservice.imginfo(nickName);
		request.setAttribute("imginfo", imginfo);
		MemberDTO memberDto = myInfoService.myInfo(nickName);
		memberDto.toString();
		System.out.println("ze");
		session.setAttribute("memberDto", memberDto);
		return "myPage/myPage";
	}
	
	@RequestMapping("/infoModifyProc.do")
	public String infoModifyProc(MemberDTO memberDto, String id) {
		memberDto.setId(id);
		System.out.println(memberDto.toString());
		myInfoService.infoModifyProc(memberDto);
		session.removeAttribute("loginInfo");
		return "home";
	}
	
	@RequestMapping("/modiPage.do")
	public String modiPage(HttpServletRequest request) {
		String nickName = (String)session.getAttribute("loginInfo");
		MemberDTO memberDto = myInfoService.myInfo(nickName);
		Map<String,Integer> imginfo = writerservice.imginfo(nickName);
		request.setAttribute("imginfo", imginfo);
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
		String nickName = (String)session.getAttribute("loginInfo");
		return myInfoService.currentPwCheck(nickName, currentPw);

	}
	
	@RequestMapping("/modifyPwProc.do")
	public String modifyPwProc(String pw) {
		String nickName = (String)session.getAttribute("loginInfo");
		myInfoService.modifyPwProc(pw, nickName);
		session.removeAttribute("loginInfo");
		return "home";
	}
	
	@RequestMapping(value="profileimg", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String modiprofileimg(MultipartFile file, String nickname) {
		System.out.println("오니");
		System.out.println(nickname);
		System.out.println(file);
		String path = session.getServletContext().getRealPath("profileimage");
		String url = myInfoService.modiprofileimg(file, path, nickname);
		System.out.println();
		return url; 
	}
	
}
