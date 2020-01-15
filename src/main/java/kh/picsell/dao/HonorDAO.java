package kh.picsell.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.HonorDTO;
import kh.picsell.dto.WriterImageUpDTO;

@Repository
public class HonorDAO {
@Autowired
private SqlSessionTemplate jdbc;

//등록
public int insert(HonorDTO dto) throws Exception{
	return jdbc.insert("Honor.insert",dto);
}
public List<HonorDTO> honorlist() throws Exception{ //명예의전당 전체리스트
	return jdbc.selectList("Honor.honorlist");
}
public int like(int honor_seq) throws Exception{
	return jdbc.update("Honor.like",honor_seq);
}
public int dislike(int honor_seq) throws Exception{
	return jdbc.update("Honor.dislike",honor_seq);
}
public List<WriterImageUpDTO> showlike(WriterImageUpDTO imgdto){
	return jdbc.selectList("Honor.showlike",imgdto);
}
public List<WriterImageUpDTO> showview(WriterImageUpDTO imgdto){
	return jdbc.selectList("Honor.showview",imgdto);
}
public List<WriterImageUpDTO> showdownload(WriterImageUpDTO imgdto){
	return jdbc.selectList("Honor.showdownload",imgdto);
}
public int insertcheck(int img_seq) throws Exception{ //이미 등록된사진인지
	return jdbc.selectOne("Honor.insertcheck", img_seq);
}
	
}
