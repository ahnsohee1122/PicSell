package kh.picsell.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.EditNoticeFileDTO;
import kh.picsell.dto.PieceNoticeFileDTO;

@Repository
public class EditNoticeFileDAO {
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public void fileUpload(EditNoticeFileDTO editFileDto) {

		jdbc.insert("EditNoticeFile.fileUpload", editFileDto);
	}
	
	public List<EditNoticeFileDTO> selectAll(int editNoticeFile_parentSeq ){
		return jdbc.selectList("EditNoticeFile.selectAll", editNoticeFile_parentSeq);
	} 
}
