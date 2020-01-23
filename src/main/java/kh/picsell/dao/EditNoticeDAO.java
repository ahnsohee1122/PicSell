package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.EditNoticeDTO;
import kh.picsell.dto.PieceNoticeDTO;

@Repository
public class EditNoticeDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<EditNoticeDTO> selectAll(){
		return jdbc.selectList("EditNotice.selectAll");
	}
	
	public void write(EditNoticeDTO editNoticeDto){
		jdbc.insert("EditNotice.insert", editNoticeDto);
	}
	
	public int getParentSeq(String editNotice_writer) {
		int result = jdbc.selectOne("EditNotice.getParentSeq", editNotice_writer);
		return result;
	}
	
	public void viewCountUp(int editNotice_seq) {
		jdbc.update("EditNotice.viewCountUp", editNotice_seq);
	}
	
	public EditNoticeDTO detail(int editNotice_seq) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("editNotice_seq", editNotice_seq);
		return jdbc.selectOne("EditNotice.detail", param);
	}
	
	public EditNoticeDTO previousRow(int seq){
		return jdbc.selectOne("EditNotice.previousRow", seq);
	} 
	
	public EditNoticeDTO nextRow(int seq) {
		return jdbc.selectOne("EditNotice.nextRow", seq);
	}
	
	public void delete(int editNotice_seq) {
		jdbc.delete("EditNotice.delete", editNotice_seq);
	}
	
	public void modify(EditNoticeDTO editNoticeDto) {
		jdbc.update("EditNotice.update", editNoticeDto);
	}
}
