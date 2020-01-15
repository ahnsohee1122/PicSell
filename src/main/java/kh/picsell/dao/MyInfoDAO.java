package kh.picsell.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.MemberDTO;

@Repository
public class MyInfoDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public MemberDTO myInfo(String nickName) {
		Map<String, String> param = new HashMap<>();
		param.put("nickName", nickName);
		
		MemberDTO d = jdbc.selectOne("MyInfo.myInfo", param);
		System.out.println("zz");
		return d;
	}
	
	public void infoModifyProc(MemberDTO memberDto) {
		jdbc.update("MyInfo.infoModify", memberDto);
	}
	
	public String currentPwCheck(String nickname) {
		return jdbc.selectOne("MyInfo.currentPwCheck", nickname);
	}
	
	public void modifyPwProc(String pw, String nickname) {
		Map<String, String> param = new HashMap<>();
		param.put("pw", pw);
		param.put("nickname", nickname);
		jdbc.update("MyInfo.modifyPw", param);
	}
	
//	public void modifyInfo(String nick, MemberDTO dto) {
//		Map<String, Object> param = new HashMap<>();
//		param.put("nick", nick);
//		param.put("dto", dto);
//		jdbc.update("MyInfo.modifyInfo", param);
//	}
}
