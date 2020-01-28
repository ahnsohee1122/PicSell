package kh.picsell.project;

import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.picsell.dto.ChargeListDTO;
import kh.picsell.dto.DealListDTO;
import kh.picsell.dto.MemberDTO;
import kh.picsell.dto.PointDTO;
import kh.picsell.service.MoneyService;
import kh.picsell.service.WriterpageService;

@Controller
@RequestMapping("/money")
public class MoneyController {

	@Autowired
	private MoneyService money_sv;

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private WriterpageService writerservice;

	
	
	// 오른쪽 바로 포인트랑 수익금 보내기 
	@RequestMapping(value = "/top_money.do")
	@ResponseBody
	public Map<String, Integer> top_money_aop() {
		String nickname = (String)session.getAttribute("loginInfo");
		Map<String, Integer> map = new HashMap<>(); 
		int my_point = money_sv.getPoint(nickname);
		int my_profit = money_sv.getProfit(nickname);
		map.put("my_point", my_point);
		map.put("my_profit", my_profit);
		return map;
	}
	
	// 충전 금액 선택 화면으로 가게하기 
	@RequestMapping(value = "/charge.do")
	public String plus_aop() {
		String nickname = (String)session.getAttribute("loginInfo");
		MemberDTO writerinfo = writerservice.writerInfo(nickname);
	    Map<String,Integer> imginfo = writerservice.imginfo(nickname);
	    request.setAttribute("imginfo", imginfo);
	    request.setAttribute("memberDto", writerinfo);
		return "money/charge";
	}

	// 충전 로직 완료 + form으로 데이터 받아서 충전 내역 화면에 뿌리기 
	@RequestMapping(value = "/chargeComplete.do")
	public String chargeComplete_aop(String receipt_id, int price, 
			String payment_name, String requested_at) {
		// 1. 세션에서 아이디값을 가져온다 
		String nickname = (String) session.getAttribute("loginInfo");
		String deal_sort = "충전";
		String money_sort = "포인트";
		// 2. DB에 충전내역, 포인트 입출금내역을 저장한다
		// 3. 충전 내역을 가져와서 DTO에 담는다 
		ChargeListDTO dto = money_sv.Charge(nickname, receipt_id, price, payment_name, requested_at, deal_sort, money_sort);
		request.setAttribute("dto", dto);
		MemberDTO writerinfo = writerservice.writerInfo(nickname);
	    Map<String,Integer> imginfo = writerservice.imginfo(nickname);
	    request.setAttribute("imginfo", imginfo);
	    request.setAttribute("memberDto", writerinfo);
		// 4. 충전 내역 화면으로 보낸다 
		return "money/chargeComplete";
	}

	/////////////////////////////////////////////////////////
	
	// 사진 구매하기 
	@RequestMapping("/buy.do")
	@ResponseBody
	public String buy_aop(String writer_nickname, int deal_img_seq) {
		String buyer_nickname = (String)session.getAttribute("loginInfo");
		// 날짜
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String deal_date = sdf.format(today);
		// 구분
		String buyer_deal_sort = "구매";
		String writer_deal_sort = "판매";
		String buyer_money_sort = "포인트";
		String writer_money_sort = "수익금";
		int point = 500;
		if(writer_nickname == buyer_nickname) {
			return "본인의 사진은 구매하실 수 없습니다..?";
		}
		money_sv.buy(deal_date, point, deal_img_seq, buyer_nickname, writer_nickname, buyer_deal_sort, writer_deal_sort, buyer_money_sort, writer_money_sort);
		return "";	
	}
	///////////////////////////////////////////////////////////////////

	// 내 포인트 확인하기 화면으로 가기 
	@RequestMapping("/myPoint.do")
	public String myPoint_aop(String msg) {
		String nickname = (String)session.getAttribute("loginInfo");
		// 1. 내 포인트 확인하기 
		int point = money_sv.getPoint(nickname);
		request.setAttribute("point", point);
		// 2. 내 수익금 확인하기 
		int profit = money_sv.getProfit(nickname);
		request.setAttribute("profit", profit);
		// 3. 포인트 입출금 내역 확인하기 
		List<PointDTO> list = new ArrayList<>();
		list = money_sv.getPointList(nickname);
		request.setAttribute("list", list);
		request.setAttribute("msg", msg);
		MemberDTO writerinfo = writerservice.writerInfo(nickname);
	    Map<String,Integer> imginfo = writerservice.imginfo(nickname);
	    request.setAttribute("imginfo", imginfo);
	    request.setAttribute("memberDto", writerinfo);
		return "money/myPoint";
	}

	///////////////////////////////////////////////////////////////////

	// 환급 페이지로 이동 
	@RequestMapping(value = "/moneyBack.do", produces="text/html; charset=UTF-8")
	public String moneyBack_aop(String msg) {
		String nickname = (String)session.getAttribute("loginInfo");
		int profit = money_sv.getProfit(nickname);
		System.out.println(profit);
		request.setAttribute("msg", msg);
		request.setAttribute("profit", profit);
		MemberDTO writerinfo = writerservice.writerInfo(nickname);
	    Map<String,Integer> imginfo = writerservice.imginfo(nickname);
	    request.setAttribute("imginfo", imginfo);
	    request.setAttribute("memberDto", writerinfo);
		return "money/moneyBack";
	}
	
	// 환급 금액 체크하기 
	@RequestMapping(value="/moneyBack_preCheck.do")
	@ResponseBody
	public String moneyBack_preCheck_aop(int back_point) {
		return "moneyBack";
	}
	
	// 환급하기 
	@RequestMapping(value="/moneyBackProc.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String money_back_aop(int back_point) {
		String nickname = (String)session.getAttribute("loginInfo");
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String formatted_requested_at = sdf.format(today);
			String deal_sort = "환급";
			String money_sort = "수익금";
			back_point = -back_point;
			money_sv.money_back(nickname, deal_sort, formatted_requested_at, back_point, money_sort);
			return "";
	}

	///////////////////////////////////////////////////////////////////
	
	// 포인트 전환 페이지로 이동 
	@RequestMapping("/change.do")
	public String change_aop() {
		String nickname = (String)session.getAttribute("loginInfo");
		// 전환 가능 수익금을 가지고 감 
		int profit = money_sv.getProfit(nickname);
		request.setAttribute("profit", profit);
		MemberDTO writerinfo = writerservice.writerInfo(nickname);
	    Map<String,Integer> imginfo = writerservice.imginfo(nickname);
	    request.setAttribute("imginfo", imginfo);
	    request.setAttribute("memberDto", writerinfo);
		return "money/change";
	}
	
	// 수익금을 포인트로 전환하기 
	@RequestMapping("/changeProc.do")
	@ResponseBody
	public String changeProc_aop(int money) {
		String nickname = (String)session.getAttribute("loginInfo");


			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String formatted_requested_at = sdf.format(today);
			String deal_sort = "포인트전환";
			String point_money_sort = "포인트";
			String profit_money_sort = "수익금";
			int change_profit = -money;
			money_sv.money_change(nickname, deal_sort, formatted_requested_at, 
					money, change_profit, point_money_sort, profit_money_sort);
			
			return "";
		
	}
	///////////////////////////////////////////////////////////////////

	
	// 구매 내역 확인하기
	@RequestMapping("/buy_list.do")
	public String buy_list_aop() {
		String nickname = (String)session.getAttribute("loginInfo");
		List<Map<String, Object>> list = money_sv.buy_list(nickname);
		request.setAttribute("list", list);
		MemberDTO writerinfo = writerservice.writerInfo(nickname);
	    Map<String,Integer> imginfo = writerservice.imginfo(nickname);
	    request.setAttribute("imginfo", imginfo);
	    request.setAttribute("memberDto", writerinfo);
		return "money/Buy_List_Check";
	}
	
	// 수익금 내역 확인하기 
	@RequestMapping("/profit_list.do")
	public String profit_list_aop() {
		System.out.println("도착");
		String nickname = (String)session.getAttribute("loginInfo");
		List<Map<String, Object>> list = money_sv.profit_list(nickname);
		System.out.println(list.size());
		System.out.println();
		request.setAttribute("list", list);
		MemberDTO writerinfo = writerservice.writerInfo(nickname);
	    Map<String,Integer> imginfo = writerservice.imginfo(nickname);
	    request.setAttribute("imginfo", imginfo);
	    request.setAttribute("memberDto", writerinfo);
		return "money/Sell_List_Check";
		
	}
	
	//////////////////////////////////////////////////////////////////
	
	// 관리자 > 포인트 내역 확인하기
	@RequestMapping("/admin_point.do")
	public String admin_point_adminAop() {
		List<PointDTO> list = money_sv.admin_point();
		request.setAttribute("list", list);
		return "money/admin_point";
	}
	
	// 관리자 > 거래 내역 확인하기
	@RequestMapping("/admin_deal.do")
	public String admin_deal_adminAop() {
		List<Map<String, Object>> list = money_sv.admin_deal();
		request.setAttribute("list", list);
		return "money/admin_deal";
	}

}
