package kh.picsell.project;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import kh.picsell.dto.MemberDTO;
import kh.picsell.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private HttpSession session;

	@Autowired
	private MemberService service;

	@RequestMapping("/signup.do") //회원가입페이지로이동
	public String toSignup() {
		return "member/signup";
	}
	@RequestMapping("/findid.do") //아디찾기페이지로이동
	public String findid() {
		return "member/find_id_pw";
	}
	@RequestMapping("/findpw.do") //비번찾기페이지로이동
	public String findpw() {
		return "member/find_id_pw";
	}
	@RequestMapping("/login.do") //로그인페이지로이동
	public String login() {

		return "member/login";
	}
	@RequestMapping(value="/signupProc.do", produces="text/html; charset=UTF-8") //회원가입
	@ResponseBody
	public String signupProc(MemberDTO dto) {
		String deal_sort = "회원가입";
		// 날짜
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String point_date = sdf.format(today);
		int point = 1000;
		String money_sort = "포인트";
		try {
			
			int result = service.insert(dto, deal_sort, point_date, point, money_sort);
			if(result>0) {
				return"ㅇㅋ";
			}else {
				return"ㄴㄴ";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "서버에러";
		}
	}

	@RequestMapping(value="/idCheck.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String idCheck(String id) { //아디중복확인


		try {
			System.out.println(id);
			int result = service.idCheck(id);
			System.out.println(result);
			if(result >0) {return"중복"; }
			else {return"가능";}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "서버에러입니다.";

	}

	@RequestMapping(value="/mailCheck.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String mailCheck(String email) { //메일중복확인

		try {
			System.out.println(email);
			int result = service.mailCheck(email);
			System.out.println(result);
			if(result >0) {return"중복된 메일주소입니다."; }
			else {return"사용 가능한 메일주소입니다.";}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return"서버에러입니다.";
	}

	@RequestMapping(value="/nickCheck.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String nickCheck(String nickname) { //닉네임 중복확인
		System.out.println(nickname);
		try {
			int result = service.nickCheck(nickname);
			if(result>0) {
				return"중복된 별명입니다.";
			}else {return"사용가능한 별명입니다.";}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return"서버에러입니다";
	}
	@RequestMapping(value="/loginProc.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String loginProc(String id, String pw, HttpServletRequest request) {
		System.out.println(id+" : "+pw);
		try {
			MemberDTO dto = service.getnick(id);
			if(dto==null) {
				return"로그인실패!";
						
			}else {
			String nickname = dto.getNickname();
			System.out.println(nickname);
			
			int result = service.login(id, pw);
			MemberDTO black1 = service.getblack(id);
			int black = black1.getBlack();
			System.out.println(result);
			if(result>0) {
				if(black==0) {
					int result1 = service.managercheck(id, pw); //매니저로그인
					if(result1 > 0) {
						
						session = request.getSession();
						session.setAttribute("adminInfo", nickname);
						return  "관리자로그인성공";
					}else {
						//mav.addObject("로그인성공", ok);
						session = request.getSession(); //일반회원로그인
						session.setAttribute("loginInfo", nickname);
						return  "로그인성공";
					}
					
				}else if(black==1) { //블랙1단계로그인
					
						//mav.addObject("로그인성공", ok);
						session = request.getSession();
						session.setAttribute("loginInfo", nickname);
						return  "블랙1";
					
					
				}else if(black==2) { //블랙2단계로그인(안되게)
					return "블랙2";
				}

			}else {
				return "로그인실패!";
			}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "서버에러입니다 관리자에게 문의하세요";

		}
		return "";
		
	}
	
	@RequestMapping(value="/findidProc.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String idfindProc(String name, String email, HttpServletRequest request) { //아디찾기
			try {
			MemberDTO dto =  service.idfind(name, email);
			String id = dto.getId();
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return "회원목록없음";
		}
	}

	@RequestMapping("/Logout.do")
	public String logout() { //로그아웃
		String adminInfo = (String)session.getAttribute("adminInfo");
		String loginInfo = (String)session.getAttribute("loginInfo");
		if(adminInfo!=null) {			
			session.removeAttribute("adminInfo");
		}else if(loginInfo!=null) {			
			session.removeAttribute("loginInfo");
		}
		return "redirect:../home";
	}
	
	@RequestMapping(value="/pwchange.do", produces="text/html; charset=UTF-8")
	@ResponseBody 
	public String pwchange(String id, String input, String email, HttpServletRequest request) { // 패스워드찾기
		System.out.println("입력값:"+input);
		String pw = (String)session.getAttribute("AuthenticationKey"); //메일인증코드
		System.out.println("바뀔값:"+pw);
		System.out.println(email);
		MemberDTO dto = new MemberDTO();
		dto.setPw(pw);
		System.out.println(dto.getPw());
		try {
			if(input.contentEquals(pw)) { //입력값과 메일인증코드가 같다면
				System.out.println("같음");
				int result = service.pwchange(pw, id, email);
				if(result>0) {
					System.out.println("변경완료");
					return"변경완료";}
				else {
					System.out.println("변경실패");
						return"변경실패";
					}
			}else {
				System.out.println("다름");
				return"인증번호";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return"실패했습니다";
		}
	}

	@RequestMapping("/memout.do")
	public String memout() {

		String nickname = (String)session.getAttribute("loginInfo"); //닉네임으로 회원탈퇴
		try {
			int result = service.memout(nickname);
			session.invalidate();
			if(result>0) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "home";
	}
	
	@RequestMapping("/manage.do")
	public String manage(MemberDTO dto, HttpServletRequest request) { //회원관리(목록조회)
		List<MemberDTO> list;
		try {
		list = service.getList();
		request.setAttribute("list", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "member/manage";
	}
	
	@RequestMapping(value="/blackup.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String blackup(String id, HttpServletRequest request) { //블랙1업
		int result;
		try {
			result = service.blackup(id);
			if(result>0) {
				return "블랙업";
			}else {
				return "실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "서버";
		}
	}
	
	@RequestMapping(value="/blackdown.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String blackdown(String id, HttpServletRequest request) { //블랙1다운
		int result;
		try {
			result = service.blackdown(id);
			if(result>0) {
				return "블랙다운";
			}else {
				return "실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "서버";
		}
	}

}
