package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.NoticeDTO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate jdbc;


	public List<NoticeDTO> selectAll(){
		return jdbc.selectList("Notice.selectAll");
	}

	public NoticeDTO detail(int notice_seq) {
		Map<String, Integer> param = new HashMap<>();
		param.put("notice_seq", notice_seq);
		return jdbc.selectOne("Notice.detail", param);
	}

	public void write(NoticeDTO noticeDto){
		jdbc.insert("Notice.insert", noticeDto);
	}

	public int getParentSeq(String notice_writer) {
		int result = jdbc.selectOne("Notice.getParentSeq", notice_writer);
		return result;
	}
	
	public void viewCountUp(int notice_seq) {
		jdbc.update("Notice.viewCountUp", notice_seq);
	}
	
	public void delete(int notice_seq) {
		jdbc.delete("Notice.delete", notice_seq);
	}
	
}
