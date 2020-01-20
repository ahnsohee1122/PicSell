package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.PieceNoticeCommentDTO;

@Repository
public class PieceNoticeCommentDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<PieceNoticeCommentDTO> selectAll(int pieceNotice_seq){
		return jdbc.selectList("PieceNoticeComment.selectAll", pieceNotice_seq);
	}
	
	public void commentDelete(int comment_seq) {
		jdbc.delete("PieceNoticeComment.delete", comment_seq);
	}
	
	public void commentWrite(int pieceNotice_seq, String writer, String comment) {
		Map<String, Object> map = new HashMap<>();
		map.put("pieceNotice_seq", pieceNotice_seq);
		map.put("writer", writer);
		map.put("notice_comment", comment);
		jdbc.insert("PieceNoticeComment.write", map);
	}
	
	public void commentModify(int comment_seq, String comment) {
		Map<String, Object> map = new HashMap<>();
		map.put("comment_seq", comment_seq);
		map.put("comment", comment);
		jdbc.update("PieceNoticeComment.modify", map);
	}
	
	
	public int getCommetSeq(int pieceNotice_seq) {
		return jdbc.selectOne("PieceNoticeComment.getCommetSeq", pieceNotice_seq);
	}
	
	public PieceNoticeCommentDTO commentSelect(int comment_seq, String writer) {
		Map<String, Object> map = new HashMap<>();
		map.put("comment_seq", comment_seq);
		map.put("writer", writer);
		return jdbc.selectOne("PieceNoticeComment.commentSelect", map);
	}
}
