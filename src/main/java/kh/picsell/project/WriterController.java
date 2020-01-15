package kh.picsell.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dto.MemberDTO;
import kh.picsell.dto.WriterImageUpDTO;
import kh.picsell.service.WriterUploadService;
import kh.picsell.service.WriterpageService;

@Controller
@RequestMapping("/writer")
public class WriterController {

	@Autowired
	private HttpSession session;

	@Autowired
	private WriterUploadService service;

	@Autowired
	private WriterpageService writerservice;

	//작가 홈 도착
	@RequestMapping("/writer.do")
	public String contest() {
		System.out.println("Writer Page");
		return "writer/writer";
	}

	//업로드 (+)버튼 누름
	@RequestMapping("doupload")
	public String upload() {
		return "writer/uploadpage";
	}

	//컨텐츠업로드
	@RequestMapping("upload")
	public String upload(MultipartFile[] file, HttpServletRequest request, WriterImageUpDTO dto) {
		System.out.println("업로드도착");
		String nickname = (String)session.getAttribute("loginInfo");
		String path = session.getServletContext().getRealPath("writeruploadfiles");
		String watermarkpath = session.getServletContext().getRealPath("watermarkfiles");
		service.upload(file,request,dto,path,watermarkpath,nickname);
		return "writer/writer";
	}

	//작가페이지로 이동
	@RequestMapping("writerpage")
	public String view(HttpServletRequest request, String nickname) {
//		String nickname = (String)session.getAttribute("loginInfo");
		MemberDTO writerinfo = writerservice.writerInfo(nickname);
		Map<String,Integer> imginfo = writerservice.imginfo(nickname);
		request.setAttribute("imginfo", imginfo);
		request.setAttribute("writerdto", writerinfo);
		return "writer/writerpage";
	}

	//작가페이지 사진뿌리기
	@RequestMapping("list")
	@ResponseBody
	public List<WriterImageUpDTO> list(int currentPage, String nickname) {
		System.out.println("hi");
//		String nickname = (String)session.getAttribute("loginInfo");
		int start = 0;
		int end = 0 ;
		Map<String,Object> param = new HashMap<>();
		List<WriterImageUpDTO> list;
		if(currentPage == 1) {
			param.put("start", 0);
			param.put("end", 20);
			param.put("nickname",nickname);
			list = writerservice.writerview(param);
			
			return list;
		}else {
			System.out.println(currentPage);
			start = currentPage * 10 + 1;
			end = start + (10 - 1);	
			param.put("start", start);
			param.put("end", end);
			param.put("nickname",nickname);
			list = writerservice.writerview(param);
			return list;
		}
	}
}