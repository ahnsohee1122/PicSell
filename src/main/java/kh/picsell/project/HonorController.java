package kh.picsell.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.picsell.dto.HonorDTO;
import kh.picsell.dto.WriterImageUpDTO;
import kh.picsell.service.HonorService;

@Controller
@RequestMapping("/honor")
public class HonorController {
@Autowired
private HonorService service;

@RequestMapping("/inserthonor.do")
public String insertgo(WriterImageUpDTO imgdto, HttpServletRequest request) {
	List<WriterImageUpDTO> likelist;
	List<WriterImageUpDTO> viewlist;
	List<WriterImageUpDTO> downlist;	
	try {
		likelist = service.showlike(imgdto);
		viewlist = service.showview(imgdto);
		downlist = service.showdownload(imgdto);
		request.setAttribute("likelist", likelist);
		request.setAttribute("viewlist", viewlist);
		request.setAttribute("downlist", downlist);
	}catch(Exception e) {
		e.printStackTrace();
	}
	return"Honor/inserthonor";
}


@RequestMapping("/insert.do")
public String insert(HonorDTO dto, HttpServletRequest request) {
	System.out.println("ins");
int img_seq = Integer.parseInt(request.getParameter("img_seq"));
System.out.println("들어온 시퀀스 : "+img_seq);
	try{
		int result = service.insert(dto);
		if(result>0) {			
			return "성공";
		}else {
			return "실패";
		}
	}catch(Exception e) {
		e.printStackTrace();
		return "실패";
	}
}
@RequestMapping("/list.do")
	public String list(HttpServletRequest request) {
	List<HonorDTO> list;
	try {
		list = service.honorlist();
		request.setAttribute("list", list);
	}catch(Exception e) {
		e.printStackTrace();
		
	}
	return "Honor/honormain";
}
@RequestMapping(value="/like.do", produces="text/html; charset=UTF-8")
@ResponseBody
public String like(int honor_seq) {
	try {
		int result = service.like(honor_seq);
		if(result>0) {
			return "ㅇ";
		}else {
			return "s";
		}
	}catch(Exception e) {
		e.printStackTrace();
		return "서버";
	}
}
@RequestMapping(value="/dislike.do", produces="text/html; charset=UTF-8")
@ResponseBody
public String dislike(int honor_seq) {
	try {
		int result = service.dislike(honor_seq);
		if(result>0) {
			return "ㅇ";
		}else {
			return "s";
		}
	}catch(Exception e) {
		e.printStackTrace();
		return "서버";
	}
}
@RequestMapping(value="/insertcheck.do", produces="text/html; charset=UTF-8")
@ResponseBody
public String insertcheck(int img_seq) {
	try {
		int result = service.insertcheck(img_seq);
		if(result>0) {
			return "중복";
		}else {
			return "가능";
		}
	}catch(Exception e) {
		e.printStackTrace();
		return "서버";
	}
}
}
