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
   
//      List<Integer> seq = new ArrayList<>();
      
//      for(ContestDTO c : list) {
//         System.out.println(c.getContest_seq());
//         seq.add(c.getContest_seq());
//      }
  	
  	try {
		
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