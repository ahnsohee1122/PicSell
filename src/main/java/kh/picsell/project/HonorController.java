package kh.picsell.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.picsell.dto.HonorDTO;
import kh.picsell.dto.MemberDTO;
import kh.picsell.dto.WriterImageUpDTO;
import kh.picsell.service.HonorService;
import kh.picsell.service.MemberService;

@Controller
@RequestMapping("/honor")
public class HonorController {
@Autowired
private HonorService service;
@Autowired
private HttpSession session;



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
@RequestMapping("/honorlist.do")
public String honorlist(MemberDTO mdto, String nickname, HttpServletRequest request) {
	List<MemberDTO> memlist;
	List<MemberDTO> list1;
	List<MemberDTO> list2;
	List<MemberDTO> list3;
	
	try {
		MemberDTO mlist1 = service.dfirst();
		MemberDTO mlist2 = service.dsecond();
		MemberDTO mlist3 = service.dthird();
		if(mlist3!=null) {			
			session.setAttribute("dto1", mlist1.getNickname());
			session.setAttribute("dto2", mlist2.getNickname());
			session.setAttribute("dto3", mlist3.getNickname());
		}
		

		memlist = service.manlike(mdto);
		list1 = service.first(mdto);
		list2 = service.second(mdto);
		list3 = service.third(mdto);
		request.setAttribute("memlist", memlist);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);

		List<WriterImageUpDTO> imglist1;
		List<WriterImageUpDTO> imglist2;
		List<WriterImageUpDTO> imglist3;
		imglist1 = service.manpic(mlist1.getNickname());
		imglist2 = service.manpic(mlist2.getNickname());
		imglist3 = service.manpic(mlist3.getNickname());
		request.setAttribute("imglist1", imglist1);
		request.setAttribute("imglist2", imglist2);
		request.setAttribute("imglist3", imglist3);
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return"Honor/honorlist";
}

@RequestMapping("/insert.do")
public String insert(HonorDTO dto, HttpServletRequest request) {

	try{
		int result = service.insert(dto);
		System.out.println(result);
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
	System.out.println(img_seq);
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
