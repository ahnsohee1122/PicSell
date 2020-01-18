package kh.picsell.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.NoticeFileDTO;
import kh.picsell.dto.PieceNoticeFileDTO;

@Repository
public class PieceNoticeFileDAO {
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public void fileUpload(PieceNoticeFileDTO pieceFileDto) {

		jdbc.insert("PieceNoticeFile.fileUpload", pieceFileDto);
	}
	
	public List<PieceNoticeFileDTO> selectAll(int pieceNoticeFile_parentSeq ){
		return jdbc.selectList("PieceNoticeFile.selectAll", pieceNoticeFile_parentSeq);
	} 
	
	public List<String> getFileSysName(int pieceNoticeFile_parentSeq){
		return jdbc.selectList("PieceNoticeFile.getFileSysName", pieceNoticeFile_parentSeq);
	}
	
	public void delete(int pieceNoticeFile_parentSeq) {
		jdbc.delete("PieceNoticeFile.delete", pieceNoticeFile_parentSeq);
	}
	
	public void deleteFile(int pieceNoticeFile_seq) {
		jdbc.delete("PieceNoticeFile.deleteFile", pieceNoticeFile_seq);
	}
}
