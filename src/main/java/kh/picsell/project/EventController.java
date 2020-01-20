package kh.picsell.project;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.picsell.dto.EventDTO;
import kh.picsell.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	private EventService event_sv;

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;
	
	// 출석체크 화면 진입  
		@RequestMapping(value = "/attendance_check.do")
		public String home() {
			String nickname = (String)session.getAttribute("loginInfo");	
			
			// 1. 그날 출석체크 했는지 안했는지 체크 > 버튼 기능 조절 
			String today = LocalDate.now().toString();
			System.out.println(nickname);
			System.out.println(today);
			EventDTO dto4 = event_sv.todayCheck(nickname, today);
			if(dto4 != null) {
				System.out.println("출석체크한 이력이 있음");
				request.setAttribute("event", "1");
			}else if(dto4 == null) {
				System.out.println("출석체크한 이력이 없음");
				request.setAttribute("event", "0");
			}

			return "/event/attendanceCheck";
		}
		
		
		// 2. 과거의 출석체크 정보 가져오기 
		@RequestMapping(value = "/getEvent", produces="text/html; charset=UTF-8")
		@ResponseBody
		public String getEvent() {
			String nickname = (String)session.getAttribute("loginInfo");
			System.out.println("통신성공");
			List<EventDTO> list = event_sv.getEvent(nickname);
			JsonArray arr = new JsonArray();
			for(EventDTO go : list) {
				JsonObject obj = new JsonObject();
				//obj.addProperty("title", go.getTitle());
				obj.addProperty("date", go.getEvent_date());
				//obj.addProperty("imageurl", go.getImageurl());
				obj.addProperty("color", "white");
				arr.add(obj);
			}
			String jstring = arr.toString();
			return jstring; 
			}

		// 3. 출석체크한 사용자의 닉네임, 날짜 추가
		// 4. 출석체크한 사용자에게 10포인트 추가
		@RequestMapping(value = "/insertEvent")
		@ResponseBody
		public String select(String event_date) {
			String nickname = (String)session.getAttribute("loginInfo");
			event_sv.insertCalendar(nickname, event_date);
			return "1";
		}

		/////////////////////////////////////////////////////
		
		// 1. 룰렛페이지로 넘어가기 
		public String rulet() {
			return "rulet";
		}
	

}
