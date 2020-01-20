package kh.picsell.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.picsell.dto.HonorDTO;
import kh.picsell.dto.HonorListDTO;
import kh.picsell.dto.MemberDTO;
import kh.picsell.dto.WriterImageUpDTO;
import kh.picsell.service.HonorService;

@Controller
@RequestMapping("/honor")
public class HonorController {
@Autowired
private HonorService service;
@Autowired
private HttpSession session;



@RequestMapping("/inserthonor.do")
public String insertgo(MemberDTO dto, HttpServletRequest request) {
	
	List<MemberDTO> memlist;

	try {

		HonorDTO hdto = service.top();
		request.setAttribute("top", hdto);
		memlist = service.manlike(dto);
		request.setAttribute("memlist", memlist);
		
		for(int i=0; i<memlist.size(); i++) {
			
			MemberDTO img = service.getpicture(memlist.get(i).getNickname());
			request.setAttribute("img", img);

		}
		
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
@RequestMapping("/mainlist.do")
public String mainlist(HonorDTO hdto, HttpServletRequest request) {
	List<MemberDTO> list1;
	List<MemberDTO> list2;
	List<MemberDTO> list3;
	List<HonorListDTO> enterlist;
	MemberDTO mdto = new MemberDTO();
	
	try {
		MemberDTO mlist1 = service.dfirst();
		MemberDTO mlist2 = service.dsecond();
		MemberDTO mlist3 = service.dthird();
		enterlist = service.enterhonorlist();
		request.setAttribute("enterlist", enterlist);
		if(mlist3!=null) {			
			session.setAttribute("dto1", mlist1.getNickname());
			session.setAttribute("dto2", mlist2.getNickname());
			session.setAttribute("dto3", mlist3.getNickname());
		}
			
		list1 = service.first(mdto);
		list2 = service.second(mdto);
		list3 = service.third(mdto);
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
		
		List<HonorDTO> list;
		list = service.list(hdto);
		request.setAttribute("list", list);
//		List<MemberDTO> mem = new ArrayList<>();	
//for(int i=0; i<list.size(); i++) {
//			
//			//MemberDTO img = service.getpicture(list.get(i).getNickname());
//			//request.setAttribute("img", mem);
//			//System.out.println(img.getNickname());
//	mem.add(service.getpicture(list.get(i).getNickname()));
//		}
//request.setAttribute("img",mem);
//System.out.println(mem.size());
//System.out.println(mem.get(0).getProfileimg());
		
		List<MemberDTO> mList = new ArrayList<>();
		
		for(int i=0; i<list.size(); i++) {			
			mList.add(service.getpicture(list.get(i).getNickname()));
		}
		request.setAttribute("mList", mList);

		
		List<HonorDTO> hlist1 = service.hfirst();
		List<HonorDTO> hlist2 = service.hsecond();
		List<HonorDTO> hlist3 = service.hthird();
		request.setAttribute("hlist1", hlist1);
		request.setAttribute("hlist2", hlist2);
		request.setAttribute("hlist3", hlist3);
		
		MemberDTO img1 = service.getpicture(hlist1.get(0).getNickname());
		MemberDTO img2 = service.getpicture(hlist2.get(0).getNickname());
		MemberDTO img3 = service.getpicture(hlist3.get(0).getNickname());
		request.setAttribute("img1", img1);
		request.setAttribute("img2", img2);
		request.setAttribute("img3", img3);
	}catch(Exception e) {
		e.printStackTrace();
		
	}
	return "Honor/mainlist";
}
@RequestMapping("/mandetail.do")
public String mandetail(String nickname, HttpServletRequest request) {
	try {
		List<WriterImageUpDTO> imglist1;
		imglist1 = service.manpic(nickname);
		request.setAttribute("imglist1", imglist1);
System.out.println(nickname);
	}catch(Exception e) {
		e.printStackTrace();
	}
	return "Honor/mandetail";
}

@RequestMapping(value="/insert.do", produces="text/html; charset=UTF-8")
@ResponseBody
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
@RequestMapping(value="/vote.do", produces="text/html; charset=UTF-8")
@ResponseBody
public String like(String nickname) {
	System.out.println(nickname);
	try {
		String nick = (String)session.getAttribute("loginInfo");
		System.out.println(nick);
		int votecheck = service.votecheck(nick);
		System.out.println("투표 했는지"+votecheck);
		if(votecheck>0) {
			return"이미완료";
		}else {			
			int result = service.like(nickname);
			System.out.println("투표수올라감"+result);
			if(result>0) {
				int ni = service.voteinsert(nick);
				System.out.println("투표테이블에올라감"+ni);
				if(ni>0) {
					return"ㅇ";
				}else {					
					return "ㄴ";
				}
			}else {
				return "s";
			}
		}
		
	}catch(Exception e) {
		e.printStackTrace();
		return "서버";
	}
}

@RequestMapping(value="/insertcheck.do", produces="text/html; charset=UTF-8")
@ResponseBody
public String insertcheck(String nickname) {
	try {
		int result = service.insertcheck(nickname);
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
@RequestMapping(value="/delete.do", produces="text/html; charset=UTF-8")
@ResponseBody
public String delete() {
	try {
		HonorDTO hdto = service.top();
		System.out.println("hdto:"+hdto);
		int honorpoint = hdto.getHonorpoint();
		String nickname = hdto.getNickname();
		System.out.println(honorpoint+"(명예점수), "+nickname);
		
		session.setAttribute("nickname", nickname);
		session.setAttribute("honorpoint", honorpoint);
		
		int result = service.delete();
		int re = service.votedelete();
		int enter = service.enter(nickname, honorpoint);
		if(result>0 &&  re>0 && enter>0) {
			return "삭제";
		}else {
			return "실패";
		}
	}catch(Exception e) {
		e.printStackTrace();
		return "서버";
	}
}


}
