package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.EventDTO;

@Repository
public class EventDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	// 출석체크 
	
		// 1. 그날 출석체크 했는지 안했는지 체크 > 버튼 기능 조절
		public EventDTO todayCheck(String nickname, String event_date) {
			Map<String, String> param = new HashMap<>();
			param.put("nickname", nickname);
			param.put("event_date", event_date);
			return jdbc.selectOne("Event.todayCheck", param);
		}
		
		// 2. 과거의 출석체크 정보 가져오기 
		public List<EventDTO> getEvent(String nickname) {
			return jdbc.selectList("Event.getEvent", nickname);
		}
		
		// 3. 출석체크한 사용자의 닉네임, 날짜 추가
		public int addCalendar(String nickname, String event_date) {
			Map<String, String> param = new HashMap<>();
			param.put("nickname", nickname);
			param.put("event_date", event_date);
			return jdbc.insert("Event.addCalendar", param);
		}
		
		// 4. 출석체크한 사용자에게 10포인트 추가
		public int addPoint(String nickname, String point_date) {
			Map<String, String> param = new HashMap<>();
			param.put("nickname", nickname);
			param.put("point_date", point_date);
			return jdbc.insert("Event.addPoint", param);
			}
}
