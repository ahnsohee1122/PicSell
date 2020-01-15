package kh.picsell.service;

import java.awt.Point;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.picsell.dao.MoneyDAO;
import kh.picsell.dto.ChargeListDTO;
import kh.picsell.dto.DealListDTO;
import kh.picsell.dto.PointDTO;

@Service
public class MoneyService {

	@Autowired
	private MoneyDAO money_dao;
	
	// 사진 상세보기 화면에 포인트값 갖고가기 
	public int getPoint(String nickname) {
		int point = money_dao.getPoint(nickname);
		return point;
	}
	
	// 과거 사진 구매 이력 확인
	public DealListDTO buyHistory(String nickname, int deal_img_seq) {
		DealListDTO dto = money_dao.buyHistory(nickname, deal_img_seq);
		return dto;
	}
	
	// 전환 가능 수익금 가져오기  
	public int getProfit(String nickname) {
		int money = money_dao.getProfit(nickname);
		return money;
	}
	
	// 포인트 입출금 내역 확인하기 
	public List<PointDTO> getPointList(String nickname){
		List<PointDTO> list = money_dao.getPointList(nickname);
		System.out.println(list.size());
		return list;
	}
	
	// 포인트 거래 내역 추가 + 사진 거래 내역 추가
	@Transactional("txManager")
	public void buy(String deal_date, int point, int deal_img_seq, String buyer_nickname, String writer_nickname, 
			String buyer_deal_sort, String writer_deal_sort, String money_sort) {
		money_dao.insertBuyList(deal_date, deal_img_seq, buyer_nickname, writer_nickname);
		String point_date = deal_date;
		money_dao.pointUpdate(writer_nickname, writer_deal_sort, point_date, point, money_sort);
		point = -500;
		money_dao.pointUpdate(buyer_nickname, buyer_deal_sort, point_date, point, money_sort);
	}
	
	// 충전 완료 + 충전 내역 뿌리기 
	@Transactional("txManager")
	public ChargeListDTO Charge(String nickname, String receipt_id, int price, 
			String payment_name, String requested_at, String deal_sort, String money_sort) {
		// 2. 충전 내역을 insert한다 
		money_dao.chargeComplete(nickname, receipt_id, price, payment_name, requested_at);
		// 3. 가져온 point를 원래 point에 추가한다
		// 4. point를 update한다 
		money_dao.pointUpdate(nickname, deal_sort, requested_at, price, money_sort);
		// 5. 구매내역을 SelectAll로 화면에 뿌린다 
		ChargeListDTO dto = money_dao.chargeList(receipt_id);		
		return dto;
	}
	
	//////////////////////////////////////////////////////////////
	

	// 환급하기 
	public void money_back(String nickname, String deal_sort, String formatted_requested_at, int point, String money_sort) {
		money_dao.pointUpdate(nickname, deal_sort, formatted_requested_at, point, money_sort);
	}
	
	// 포인트 전환하기 
	@Transactional("txManager")
	public void money_change(String nickname, String deal_sort, String formatted_requested_at,
			int money, int change_profit, String point_money_sort, String profit_money_sort) {
		money_dao.pointUpdate(nickname, deal_sort, formatted_requested_at, money, point_money_sort);
		money_dao.pointUpdate(nickname, deal_sort, formatted_requested_at, change_profit, profit_money_sort);
	}
	//////////////////////////////////////////////////////////////
	
	// 구매 내역 확인하기
	public List<DealListDTO> buy_list_check(String buyer_nickname){
		List<DealListDTO> list = money_dao.buy_list_check(buyer_nickname);
		return list;
	}
	
	// 구매 내역 ( 사진 ) 확인하기
	public List<String> buy_sysname(String nickname){
		List<String> list = money_dao.buy_sysname(nickname);
		return list;
	}	
	
	// 판매 내역 확인하기 
	public List<DealListDTO> sell_list_check(String writer_nickname){
		List<DealListDTO> list = money_dao.sell_list_check(writer_nickname);
		return list;
	}
	
	// 판매 내역 ( 사진 ) 확인하기
	public List<String> sell_sysname(String nickname){
		List<String> list = money_dao.buy_sysname(nickname);
		return list;
	}	

}
