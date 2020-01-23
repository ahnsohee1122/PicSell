package kh.picsell.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.picsell.dto.DealListDTO;
import kh.picsell.dto.WriterImageUpDTO;
import kh.picsell.service.MoneyService;
import kh.picsell.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;
	
	@Autowired
	private MoneyService money_service;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpSession session;

	@RequestMapping("/Search.do")
	public String search(String tag, HttpServletRequest request) {				
		request.setAttribute("searchKeyword", tag);
		return "/search/searchList";
	}

	@RequestMapping(value="/Align.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String align(int count, String tag, String file_extension, String usage, String orderBy, String keyword2) {
		System.out.println("도착도착도착");
		System.out.println("currentPage: " + count);
		System.out.println("keyword:" + tag);
		System.out.println("extension: "+ file_extension);
		System.out.println("usage: " + usage);
		System.out.println("orderBy: " + orderBy);
		System.out.println("keyword2: " + keyword2);
		
		int start = 0;
		int end = 0 ;
		List<WriterImageUpDTO> list = null;
		if(count == 1) { // 처음엔 20개 가져오고
			start = 0;
			end = 20;
			list = service.align(start, end, tag, file_extension, usage, orderBy, keyword2);
			for(WriterImageUpDTO dto : list) {
				System.out.println(dto);
			}		

		}else { // 다음부턴 50개씩 가져옴
			start = 50 * count -79;
			end = 50 * count - 30;   
			list = service.align(start, end, tag, file_extension, usage, orderBy, keyword2);
			for(WriterImageUpDTO dto : list) {
				System.out.println(dto);
			}
		}

		String data = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			data = mapper.writeValueAsString(list);
		} catch (Exception e) {
			System.out.println("first() mapper   ::    " + e.getMessage());
		}
		return data;

//		int start = 0;
//		int end = 0;
//		start = 50 * count - 49;
//		end = 50 * count;
//		List<WriterImageUpDTO> list = service.align(start, end, tag, file_extension, usage, orderBy, keyword2);
//		for(WriterImageUpDTO dto : list) {
//			System.out.println(dto);
//		}
//		
//		String data = null;
//		ObjectMapper mapper = new ObjectMapper();
//		try {
//			data = mapper.writeValueAsString(list);
//		} catch (Exception e) {
//			System.out.println("first() mapper   ::    " + e.getMessage());
//		}
//		return data;
	}

	@RequestMapping("/DetailImage.do")
	public String detailImage(int img_seq, String nickname){
		System.out.println("도착!!!!!!!!!!!!!!!!!!");
		System.out.println(img_seq);
		System.out.println(nickname);
		System.out.println("봅시단");
		
		Object loginInfo = session.getAttribute("loginInfo");
		Object adminInfo = session.getAttribute("adminInfo");
		
		// 조회수 증가 대상
		// 1. 비회원
		// 2. 회원 & 글쓴이 아닌 사람
		// 3. 회원 & 관리자 아닌 사람
		
		// 조회수 증가 대상 아닌 사람
		// 1. 회원 & 글쓴이 : loginInfo != null && nickname.contentEquals((String)loginInfo)
		// 2. 회원 & 관리자 : adminInfo != null
		if(!((loginInfo != null && nickname.contentEquals((String)loginInfo))|(adminInfo != null))) {
			service.updateViewCount(img_seq);
		}
		
//		// 혹은 이렇게~
//		if(adminInfo != null){ // 관리자 아닌 경우
//			if(loginInfo == null | !nickname.contentEquals((String)loginInfo)){ // 비회원이거나 글쓴이 아닌 경우
//				service.updateViewCount(img_seq); // 조회수 증가
//			}
//		}
		
		// 이까지 조회수 증가


		// ****************************이 밑줄부터
		// like_list 테이블에 이미지 좋아요 기록 있는지 여부
		WriterImageUpDTO dto = service.getDetailImage(img_seq); 
		int likepoint = service.getLikepoint(nickname); 
		
		String viewer = null; 
		if(loginInfo != null) { 
			viewer = (String)loginInfo; 
		}else if(loginInfo == null) { // 여기 관리자도 포함됨
			viewer = " ";
		}
		int likestatus = service.likeStatus(img_seq, viewer);
		
		int writerlikestatus = service.writerLikeStatus(nickname, viewer);
		// ****************************이까지

		System.out.println(dto);
		System.out.println(likepoint);

		request.setAttribute("dto", dto);
		request.setAttribute("likepoint", likepoint);
		request.setAttribute("likestatus", likestatus); // 이 줄*********************
		request.setAttribute("writerlikestatus", writerlikestatus); // 이 줄*********************
		
		// 다운로드 버튼 제어 
		
		// 로그인 안한 경우 
		if(loginInfo==null) {
				
				// 로그인 한 경우 
				}else {
				// 사진 구매 가능 여부 알기 위해서 point 받아옴 
				int point = money_service.getPoint((String)loginInfo);
				request.setAttribute("point", point);
				// 이미 구매한 사용자는 '구매'버튼이 아닌 '다운로드'버튼을 보게된다
				// 구매 이력을 가져온다 
				DealListDTO dto2 = money_service.buyHistory((String)loginInfo, dto.getImg_seq()); 
					// 구매 이력이 없는 경우 
					if(dto2==null) {
						System.out.println("구매 이력이 없음");
						request.setAttribute("history", 0);
					// 구매 이력이 있는 경우 
					}else {
						System.out.println("구매 이력이 있음");
						request.setAttribute("history", 1);
					}
					
				}
		return "/search/detailImageView";
	}


	//******************************************************************************
	@RequestMapping(value="/PhotoLike.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String photolike(int img_seq, int count) {
		System.out.println("img_seq: " + img_seq);
		System.out.println("좋아요 도착");
		System.out.println("count: " + count);

		String viewer = null;
		if(session.getAttribute("loginInfo") != null) {
			viewer = (String)session.getAttribute("loginInfo");
		}else if(session.getAttribute("adminInfo") != null) {
			viewer = (String)session.getAttribute("adminInfo");
		}
		
		int result1 = 0;
		
		// like_list 테이블
		if(count == 1) { // 좋아요 눌렀을 경우
			result1 = service.insertLikeList(img_seq, viewer);
		}else if(count == -1) { // 좋아요 취소 눌렀을 경우
			result1 = service.deleteLikeList(img_seq, viewer);
		}
		
		// writer_image_up 테이블
		int result2 = service.photolike(img_seq, count); 
		
		if(result1 > 0 && result2 > 0) {return "ok";}
		else {return "fail";}
	}

	@RequestMapping(value="/WriterLike.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String writerlike(String nickname, int count) {
		System.out.println("nickname: " + nickname);
		System.out.println("작가좋아요 도착");
		System.out.println("count: " + count);
		
		String viewer = null;
		if(session.getAttribute("loginInfo") != null) {
			viewer = (String)session.getAttribute("loginInfo");
		}else if(session.getAttribute("adminInfo") != null) {
			viewer = (String)session.getAttribute("adminInfo");
		}
		
		int result1 = 0;
		
		// like_list 테이블
		if(count == 1) { // 좋아요 눌렀을 경우
			result1 = service.insertWriterLikeList(nickname, viewer);
		}else if(count == -1) { // 좋아요 취소 눌렀을 경우
			result1 = service.deleteWriterLikeList(nickname, viewer);
		}
		
		// member 테이블
		int result2 = service.writerlike(nickname, count);
		if(result1 > 0 && result2 > 0) {return "ok";}
		else {return "fail";}
	}
	
	//******************************************************************************
	
	@RequestMapping(value="/WriterExist.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String writerexist(String writer) {
		System.out.println(writer);
		int result = service.writerexist(writer);
		if(result == 1) { // 작가 이름에 해당하는 닉네임 존재
			return "yes";
		}else { // 존재하지 X
			return "no";
		}
	}
	
	/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */	
//	@RequestMapping("/GoToLogin.do")
//	public String gotologin() {
//		return "member/login.do";
//	}
	/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */
}
