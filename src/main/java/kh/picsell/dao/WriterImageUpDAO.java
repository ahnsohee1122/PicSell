package kh.picsell.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.MemberDTO;
import kh.picsell.dto.WriterImageUpDTO;

@Repository
public class WriterImageUpDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	
	public int insert(WriterImageUpDTO dto) {
		return jdbc.insert("imageup.insert",dto);
	}
	
	public List<WriterImageUpDTO> view(Map<String,Object> param){
		return jdbc.selectList("imageup.selectSysName",param);
	}
	
	public MemberDTO writerInfo(String nickname){
		return jdbc.selectOne("imageup.writerInfo",nickname);
	}
	
	public int imgcount(String nickname) {
		return jdbc.selectOne("imageup.imgcount",nickname);
	}
	
	public int downcount(String nickname) {
		return jdbc.selectOne("imageup.downcount",nickname);
	}
	
	public int viewcount(String nickname) {
		return jdbc.selectOne("imageup.viewcount",nickname);
	}
	
	public int imglike(String nickname) {
		return jdbc.selectOne("imageup.imglike",nickname);
	}
	
	public int likepoint(String nickname) {
		return jdbc.selectOne("imageup.likepoint",nickname);
	}
	
}
