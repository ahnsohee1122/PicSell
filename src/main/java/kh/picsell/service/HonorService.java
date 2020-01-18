package kh.picsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.HonorDAO;
import kh.picsell.dto.HonorDTO;
import kh.picsell.dto.MemberDTO;
import kh.picsell.dto.WriterImageUpDTO;

@Service
public class HonorService {
@Autowired
private HonorDAO dao;

public int insert(HonorDTO dto)throws Exception {
	return dao.insert(dto);
}
public List<HonorDTO> honorlist() throws Exception{
	return dao.honorlist();
}
public int like(int honor_seq) throws Exception{
	return dao.like(honor_seq);
}
public int dislike(int honor_seq) throws Exception{
	return dao.dislike(honor_seq);
}
public List<WriterImageUpDTO> showlike(WriterImageUpDTO imgdto) throws Exception{
	return dao.showlike(imgdto);
}
public List<WriterImageUpDTO> showview(WriterImageUpDTO imgdto) throws Exception{
	return dao.showview(imgdto);
}
public List<WriterImageUpDTO> showdownload(WriterImageUpDTO imgdto) throws Exception{
	return dao.showdownload(imgdto);
}
public int insertcheck(int img_seq) throws Exception{
	return dao.insertcheck(img_seq);
}
public List<MemberDTO> manlike(MemberDTO dto){
	return dao.manlike(dto);
}
public List<WriterImageUpDTO> manpic(String nickname){
	return dao.manpic(nickname);
}
public List<MemberDTO> first(MemberDTO dto){
	return dao.first(dto);
}
public List<MemberDTO> second(MemberDTO dto){
	return dao.second(dto);
}
public List<MemberDTO> third(MemberDTO dto){
	return dao.third(dto);
}
public MemberDTO dfirst(){
	return dao.dfirst();
}
public MemberDTO dsecond(){
	return dao.dsecond();
}
public MemberDTO dthird(){
	return dao.dthird();
}
}
