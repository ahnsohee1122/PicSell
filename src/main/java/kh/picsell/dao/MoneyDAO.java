package kh.picsell.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import kh.picsell.dto.ChargeListDTO;
import kh.picsell.dto.DealListDTO;
import kh.picsell.dto.PointDTO;



@Repository
public class MoneyDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	// 포인트 가져오기 
	public int getPoint(String nickname) {
		return jdbc.selectOne("Charge.getPoint", nickname);
	}
	
	// 과거 사진 구매 이력 확인
	public DealListDTO buyHistory(String nickname, int deal_img_seq) {
		Map<String, Object> param = new HashMap<>();
		param.put("nickname", nickname);
		param.put("deal_img_seq", deal_img_seq);
		return jdbc.selectOne("Charge.buyHistory", param);
	}
	
	// 전환 가능 수익금 가져오기 
	public int getProfit(String nickname) {
		return jdbc.selectOne("Charge.getProfit", nickname);
	}
	/////////////////////////////////////////////////////////////////
	
	// 포인트 입출금 내역 확인하기 
	public List<PointDTO> getPointList(String nickname){
		return jdbc.selectList("Charge.getPointList", nickname);
	}
	
	/////////////////////////////////////////////////////////////////
	
	// 사진 거래 내역에 추가하기
	public int insertBuyList(String deal_date, int deal_img_seq, String buyer_nickname, String writer_nickname) {
		Map<String, Object> param = new HashMap<>();
		param.put("deal_date", deal_date);
		param.put("deal_img_seq", deal_img_seq);
		param.put("buyer_nickname", buyer_nickname);
		param.put("writer_nickname", writer_nickname);
		return jdbc.insert("Charge.insertBuyList", param);
	}
	
	// 다운로드 수 추가하기 
	public int downCountUp(int deal_img_seq) {
		return jdbc.update("Charge.downCountUp", deal_img_seq);
	}
	
	/////////////////////////////////////////////////////////////////
	
	// 충전 내역을 insert한다 
	public int chargeComplete(String charge_nickname, String receipt_id, int price, 
			String payment_name, String requested_at) {
		Map<String, Object> param = new HashMap<>();
		param.put("charge_nickname", charge_nickname);
		param.put("receipt_id", receipt_id);
		param.put("price", price);
		param.put("payment_name", payment_name);
		param.put("requested_at", requested_at);
		return jdbc.insert("Charge.chargeComplete", param);
	
	}
	
	// 최종 point를 update한다 > 회원가입 포인트 지급, 충전, 환급, 사진 구매하기  
	public int pointUpdate(String nickname, String deal_sort, String point_date, int point, String money_sort) {
		Map<String, Object> param = new HashMap<>();
		param.put("nickname", nickname);
		param.put("deal_sort", deal_sort);
		param.put("point_date", point_date);
		param.put("point", point);
		param.put("money_sort", money_sort);
		return jdbc.update("Charge.pointUpdate", param);
	}
	
	// 충전내역을 화면에 뿌린다 SelectOne
	public ChargeListDTO chargeList(String receipt_id) {
		return jdbc.selectOne("Charge.chargeList", receipt_id);
	}

	
	////////////////////////////////////////////////////////////////
	
	// 구매 내역 확인하기
	public List<Map<String, Object>> buy_list(String nickname){
		return jdbc.selectList("Charge.buy_list", nickname);
	}
	
	// 판매 내역 확인하기
	public List<Map<String, Object>> sell_list(String nickname){
		return jdbc.selectList("Charge.sell_list", nickname);
	}
	
	/////////////////////////////////////////////////////////////////
	
	// 관리자 > 포인트 내역 확인하기
	public List<PointDTO> admin_point(){
		return jdbc.selectList("Charge.admin_point");
	}
	
	// 관리자 > 거래 내역 확인하기
	public List<Map<String, Object>> admin_deal(){
		return jdbc.selectList("Charge.admin_deal");
	}
	

}
