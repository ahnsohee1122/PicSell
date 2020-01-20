package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.EditNoticeCommentDTO;
import kh.picsell.dto.PieceNoticeCommentDTO;

@Repository
public class EditNoticeCommentDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<EditNoticeCommentDTO> selectAll(int editNotice_seq){
		return jdbc.selectList("EditNoticeComment.selectAll", editNotice_seq);
	}
	
	public void commentDelete(int comment_seq) {
		jdbc.delete("EditNoticeComment.delete", comment_seq);
	}
	
	public void commentWrite(int editNotice_seq, String writer, String comment) {
		Map<String, Object> map = new HashMap<>();
		map.put("editNotice_seq", editNotice_seq);
		map.put("writer", writer);
		map.put("notice_comment", comment);
		jdbc.insert("EditNoticeComment.write", map);
	}
	
	public void commentModify(int comment_seq, String comment) {
		Map<String, Object> map = new HashMap<>();
		map.put("comment_seq", comment_seq);
		map.put("comment", comment);
		jdbc.update("EditNoticeComment.modify", map);
	}
	
	
	public int getCommetSeq(int editNotice_seq, String writer) {
		Map<String, Object> map = new HashMap<>();
		map.put("editNotice_seq", editNotice_seq);
		map.put("writer", writer);
		return jdbc.selectOne("EditNoticeComment.getCommetSeq", map);
	}
	
	public EditNoticeCommentDTO commentSelect(int comment_seq) {

		return jdbc.selectOne("EditNoticeComment.commentSelect", comment_seq);
	}
}
