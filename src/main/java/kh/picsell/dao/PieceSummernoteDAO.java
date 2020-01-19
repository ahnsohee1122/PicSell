package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PieceSummernoteDAO {
	@Autowired
	private SqlSessionTemplate jdbc;

	public void summernoteFile(int pieceNotice_seq, String pieceNotice_sysName) {
		Map<String, Object> param = new HashMap<>();
		param.put("pieceNotice_seq", pieceNotice_seq);
		param.put("pieceNotice_sysName", pieceNotice_sysName);
		jdbc.insert("PieceSummernote.summernoteFile", param);
	}
	
	public void delete(int pieceNotice_seq) {
		jdbc.delete("PieceSummernote.delete", pieceNotice_seq);
	}
	
	public List<String> getFileSysName(int pieceNotice_seq){
		return jdbc.selectList("PieceSummernote.getFileSysName", pieceNotice_seq);
	}
}
