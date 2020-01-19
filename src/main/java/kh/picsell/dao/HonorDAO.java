package kh.picsell.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.HonorDTO;
import kh.picsell.dto.HonorListDTO;
import kh.picsell.dto.MemberDTO;
import kh.picsell.dto.WriterImageUpDTO;

@Repository
public class HonorDAO {
@Autowired
private SqlSessionTemplate jdbc;

//등록
public int insert(HonorDTO dto) throws Exception{
	return jdbc.insert("Honor.insert",dto);
}
public int enter(HonorListDTO dto) throws Exception{
	return jdbc.insert("Honor.enter",dto);
}
public List<HonorDTO> honorlist() throws Exception{ //명예의전당 전체리스트
	return jdbc.selectList("Honor.honorlist");
}
public List<HonorListDTO> enterhonorlist() throws Exception{
	return jdbc.selectList("Honor.enterhonorlist");
}
public int like(String nickname) throws Exception{
	return jdbc.update("Honor.like",nickname);
}

public int delete() throws Exception{
	return jdbc.delete("Honor.delete");
}
public List<HonorDTO> list(HonorDTO dto) throws Exception{
	return jdbc.selectList("Honor.list", dto);
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
public int insertcheck(String nickname) throws Exception{ //이미 등록된사진인지
	return jdbc.selectOne("Honor.insertcheck", nickname);
}
public int votecheck(String nick) throws Exception{
	return jdbc.selectOne("Honor.votecheck",nick);
}
public int deletevote() throws Exception{
	return jdbc.delete("Honor.votedelete");
}
public List<MemberDTO> manlike(MemberDTO dto){
	return jdbc.selectList("Honor.manlike",dto);
}
public List<WriterImageUpDTO> manpic(String nickname){
	return jdbc.selectList("Honor.manpic",nickname);
}
public List<MemberDTO> first(MemberDTO dto){
	return jdbc.selectList("Honor.first",dto);
}
public List<MemberDTO> second(MemberDTO dto){
	return jdbc.selectList("Honor.second",dto);
}
public List<MemberDTO> third(MemberDTO dto){
	return jdbc.selectList("Honor.third",dto);
}
public MemberDTO dfirst(){
	return jdbc.selectOne("Honor.first");
}
public MemberDTO dsecond(){
	return jdbc.selectOne("Honor.second");
}
public MemberDTO dthird(){
	return jdbc.selectOne("Honor.third");
}
public List<HonorDTO> hfirst() {
	return jdbc.selectList("Honor.honorfirst");
}
public List<HonorDTO> hsecond() {
	return jdbc.selectList("Honor.honorsecond");
}
public List<HonorDTO> hthird() {
	return jdbc.selectList("Honor.honorthird");
}
public List<WriterImageUpDTO> detailview(String nickname) throws Exception{ //?
	return jdbc.selectList("Honor.secdpic", nickname);
}
public int man(String nickname) throws Exception{
	return jdbc.selectOne("Honor.manlist", nickname);
}
public List<HonorDTO> honormember(){
	return jdbc.selectList("Honor.honormember");
}
public int voteinsert(String nickname) throws Exception{
	return jdbc.insert("Honor.voteinsert",nickname);
}
	
}
