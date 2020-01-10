package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SummernoteDAO {
	@Autowired
	private SqlSessionTemplate jdbc;

	
	public void summernoteFile(int notice_seq, String notice_sysName) {
		Map<String, Object> param = new HashMap<>();
		param.put("notice_seq", notice_seq);
		param.put("notice_sysName", notice_sysName);
		jdbc.insert("Summernote.summernoteFile", param);
	}
	
	public List<String> getFileSysName(int notice_seq){
		return jdbc.selectList("Summernote.getFileSysName", notice_seq);
	}
	
	public void delete(int notice_seq) {
		jdbc.delete("Summernote.delete", notice_seq);
	}
}
