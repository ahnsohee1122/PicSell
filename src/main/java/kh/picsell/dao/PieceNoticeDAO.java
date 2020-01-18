package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.NoticeDTO;
import kh.picsell.dto.PieceNoticeDTO;

@Repository
public class PieceNoticeDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<PieceNoticeDTO> selectAll(){
		return jdbc.selectList("PieceNotice.selectAll");
	}
	
	public void write(PieceNoticeDTO pieceNoticeDto){
		jdbc.insert("PieceNotice.insert", pieceNoticeDto);
	}
	
	public int getParentSeq(String pieceNotice_writer) {
		int result = jdbc.selectOne("PieceNotice.getParentSeq", pieceNotice_writer);
		return result;
	}
	
	public void viewCountUp(int pieceNotice_seq) {
		jdbc.update("PieceNotice.viewCountUp", pieceNotice_seq);
	}
	
	public PieceNoticeDTO detail(int pieceNotice_seq) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("pieceNotice_seq", pieceNotice_seq);
		return jdbc.selectOne("PieceNotice.detail", param);
	}
	
	public PieceNoticeDTO previousRow(int seq){
		return jdbc.selectOne("PieceNotice.previousRow", seq);
	} 
	
	public PieceNoticeDTO nextRow(int seq) {
		return jdbc.selectOne("PieceNotice.nextRow", seq);
	}
	
	public void delete(int pieceNotice_seq) {
		jdbc.delete("PieceNotice.delete", pieceNotice_seq);
	}
	
	public void modify(PieceNoticeDTO pieceNoticeDto) {
		jdbc.update("PieceNotice.update", pieceNoticeDto);
	}
}
