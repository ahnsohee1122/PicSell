package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EditSummernoteDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public void summernoteFile(int editNotice_seq, String editNotice_sysName) {
		Map<String, Object> param = new HashMap<>();
		param.put("editNotice_seq", editNotice_seq);
		param.put("editNotice_sysName", editNotice_sysName);
		jdbc.insert("EditSummernote.summernoteFile", param);
	}
	
	public void delete(int editNotice_seq) {
		jdbc.delete("EditSummernote.delete", editNotice_seq);
	}
	
	public List<String> getFileSysName(int editNotice_seq){
		return jdbc.selectList("EditSummernote.getFileSysName", editNotice_seq);
	}
}
