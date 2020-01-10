package kh.picsell.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.picsell.dto.WriterImageUpDTO;
import kh.picsell.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/Search.do")
	public String search(String tag, HttpServletRequest request) {
		
		if(tag.charAt(0) == '@') {
			return ""; // 작가 페이지로
		}else {
			request.setAttribute("searchKeyword", tag);
			return "searchList";
		}

	}
	
	@RequestMapping("/Align.do")
	@ResponseBody
	public List<WriterImageUpDTO> align(int currentPage, String tag, String file_extension, String usage, String orderBy, String keyword2) {
		System.out.println("도착도착도착");
		System.out.println("currentPage: " + currentPage);
		System.out.println("keyword:" + tag);
		System.out.println("extension: "+ file_extension);
		System.out.println("usage: " + usage);
		System.out.println("orderBy: " + orderBy);
		System.out.println("keyword2: " + keyword2);

		int start = 0;
		int end = 0 ;
		Map<String,Object> param = new HashMap<String,Object>();
		if(currentPage == 1) {
			start = 0;
			end = 20;
			List<WriterImageUpDTO> list = service.align(start, end, tag, file_extension, usage, orderBy, keyword2);
			
			for(WriterImageUpDTO dto : list) {
				System.out.println(dto);
			}
			
			return list;

		}else {
			start = currentPage * 10 + 1;
			end = start + (10 - 1);   

			List<WriterImageUpDTO> list = service.align(start, end, tag, file_extension, usage, orderBy, keyword2);
			
			for(WriterImageUpDTO dto : list) {
				System.out.println(dto);
			}
			
			return list;
		}
	}
	
	
}
