package kh.picsell.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.picsell.dto.ContestDTO;
import kh.picsell.dto.HonorDTO;
import kh.picsell.dto.HonorListDTO;
import kh.picsell.dto.MemberDTO;
import kh.picsell.dto.WriterImageUpDTO;
import kh.picsell.service.ContestService;
import kh.picsell.service.HonorService;
import kh.picsell.service.MemberService;
import kh.picsell.service.WriterpageService;

@Controller
public class HomeController {

   @Autowired
   private HttpSession session;
   @Autowired
   private MemberService service;
   @Autowired
   private HttpServletRequest request;
   @Autowired
   private HonorService honorservice;
   @Autowired
   private ContestService contestservice;
   
   @Autowired
   private WriterpageService imageservice;

   @RequestMapping("/index")
   public String index() {
      System.out.println("Index Page");
      return "index";
   }

   @RequestMapping("/home")
   public String home(HonorDTO hdto, HttpServletRequest request) {
      System.out.println("공모전");
      List<ContestDTO> list =  contestservice.lastContest();
      request.setAttribute("list", list);
      List<WriterImageUpDTO> imagelist = imageservice.bestImage();
      request.setAttribute("imagelist", imagelist);
      List<MemberDTO> list1;
  	List<MemberDTO> list2;
  	List<MemberDTO> list3;
  	List<HonorListDTO> enterlist;
  	MemberDTO mdto = new MemberDTO();
//      List<Integer> seq = new ArrayList<>();
      
//      for(ContestDTO c : list) {
//         System.out.println(c.getContest_seq());
//         seq.add(c.getContest_seq());
//      }
  	
  	try {
		MemberDTO mlist1 = honorservice.dfirst();
		MemberDTO mlist2 = honorservice.dsecond();
		MemberDTO mlist3 = honorservice.dthird();
		enterlist = honorservice.enterhonorlist();
		request.setAttribute("enterlist", enterlist);
		if(mlist3!=null) {			
			session.setAttribute("dto1", mlist1.getNickname());
			session.setAttribute("dto2", mlist2.getNickname());
			session.setAttribute("dto3", mlist3.getNickname());
		}
			
		list1 = honorservice.first(mdto);
		list2 = honorservice.second(mdto);
		list3 = honorservice.third(mdto);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);		
		List<WriterImageUpDTO> imglist1;
		List<WriterImageUpDTO> imglist2;
		List<WriterImageUpDTO> imglist3;
		imglist1 = honorservice.manpic(mlist1.getNickname());
		imglist2 = honorservice.manpic(mlist2.getNickname());
		imglist3 = honorservice.manpic(mlist3.getNickname());
		request.setAttribute("imglist1", imglist1);
		request.setAttribute("imglist2", imglist2);
		request.setAttribute("imglist3", imglist3);
		HonorListDTO newhonor = honorservice.newhonor();
		request.setAttribute("latelyhonor", newhonor);
		MemberDTO latelyimg = honorservice.getpicture(newhonor.getNickname());
		request.setAttribute("latelyimg", latelyimg);
		List<HonorDTO> honorlist;
		honorlist = honorservice.list(hdto);
		request.setAttribute("honorlist", honorlist);
		
		
	}catch(Exception e) {
		e.printStackTrace();
		
	}
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
      if((String)session.getAttribute("loginInfo")!=null) { //일반회원으로 로그인
         try {
            //List<ContestDTO> imagelist = contestservice.exampleimg(contest_seq);
         String nickname = (String)session.getAttribute("loginInfo");
         System.out.println("일반회원 nick : "+nickname);
            MemberDTO black1 = service.getblacknick(nickname);
            int black = black1.getBlack();
            session.setAttribute("blackpoint", black);
            return "home";

         } catch (Exception e) {
            e.printStackTrace();
            return "error";
         }
      }else if((String)session.getAttribute("adminInfo")!=null) { //관리자로 로그인
         String nickname = (String)session.getAttribute("adminInfo");
         System.out.println("관리자닉 : "+nickname);
         try {
            MemberDTO black1 = service.getblacknick(nickname);
            request.setAttribute("list", list);
            System.out.println(black1.getBlack());
            int black = black1.getBlack();

            session.setAttribute("blackpoint", black);
            return "home";

         } catch (Exception e) {
            e.printStackTrace();
            return "error";
         }
      }else { 
         return "home";
      }

   }



}