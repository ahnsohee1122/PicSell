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
		return jdbc.selectOne("MyInfo.myInfo", param);
	}
	
	public void infoModifyProc(MemberDTO memberDto) {
		jdbc.update("MyInfo.infoModify", memberDto);
	}
}
