package kh.picsell.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.EditNoticeCommentDTO;

@Repository
public class EditNoticeCommentDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<EditNoticeCommentDTO> selectAll(int editNotice_seq){
		return jdbc.selectList("EditNoticeComment.selectAll", editNotice_seq);
	}
}
