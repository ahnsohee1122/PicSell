package kh.picsell.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dao.WriterImageUpDAO;
import kh.picsell.dto.WriterImageUpDTO;
import kh.picsell.service.WriterUploadService;

@Controller
@RequestMapping("/writer")
public class WriterController {
	@Autowired
	private WriterUploadService service;
	
	@Autowired
	private WriterImageUpDAO dao;

	@RequestMapping("gahye")
	 public String test() {
		 return "gahyetest";
	 }
	
	
	 //작가 홈 도착
		@RequestMapping("/writer.do")
		public String contest() {
			System.out.println("Writer Page");
			return "writer/writer";
		}
		
		//업로드 + 버튼 누름
		@RequestMapping("doupload")
		public String upload() {
			return "writer/uploadpage";
		}
		
		//컨텐츠 업로드
		@RequestMapping("upload")
		public String upload(MultipartFile[] file, HttpServletRequest request, WriterImageUpDTO dto) {
			System.out.println("업로드도착");
			service.upload(file,request,dto);
			return "writer/writer";
		}
		
		//작가페이지로 이동
		@RequestMapping("writerpage")
		public String view(HttpServletRequest request) {
			return "writer/writerpage";
		}
		
		//작가페이지 사진뿌리기
		@RequestMapping("list")
		@ResponseBody
		public List<WriterImageUpDTO> list(int currentPage) {
			int start = 0;
			int end = 0 ;
			Map<String,Object> param = new HashMap<>();
			List<WriterImageUpDTO> list;
			if(currentPage == 1) {
				System.out.println(currentPage);
				String nickname = "hello";
				param.put("start", 0);
				param.put("end", 20);
				param.put("nickname",nickname);
				list = service.writerview(param);
				return list;
			}else {
				System.out.println(currentPage);
				start = currentPage * 10 + 1;
				end = start + (10 - 1);	
				String nickname = "hello";
				param.put("start", start);
				param.put("end", end);
				param.put("nickname",nickname);
				list = service.writerview(param);
				return list;
			}
	}
}
