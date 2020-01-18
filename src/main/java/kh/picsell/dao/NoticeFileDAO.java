package kh.picsell.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.NoticeFileDTO;

@Repository
public class NoticeFileDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public void fileUpload(NoticeFileDTO fileDto) {
		jdbc.insert("NoticeFile.fileUpload", fileDto);
	}
	
	public List<NoticeFileDTO> selectAll(int noticeFile_parentSeq ){
		return jdbc.selectList("NoticeFile.selectAll", noticeFile_parentSeq);
	} 
	
	public List<String> getFileSysName(int noticeFile_parentSeq){
		return jdbc.selectList("NoticeFile.getFileSysName", noticeFile_parentSeq);
	}
	
	public void delete(int noticeFile_parentSeq) {
		jdbc.delete("NoticeFile.delete", noticeFile_parentSeq);
	}
	
	public void deleteFile(int noticeFile_seq) {
		jdbc.delete("NoticeFile.deleteFile", noticeFile_seq);
	}
}
