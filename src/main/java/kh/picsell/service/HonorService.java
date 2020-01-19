package kh.picsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.HonorDAO;
import kh.picsell.dto.HonorDTO;
import kh.picsell.dto.HonorListDTO;
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
public int like(String nickname) throws Exception{
	return dao.like(nickname);
}
public int voteinsert(String nickname) throws Exception{
	return dao.voteinsert(nickname);
}
public int delete()throws Exception{
	return dao.delete();
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
public int insertcheck(String nickname) throws Exception{
	return dao.insertcheck(nickname);
}
public int votecheck(String nick) throws Exception{
	return dao.votecheck(nick);
}
public int votedelete() throws Exception{
	return dao.deletevote();
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
public List<HonorDTO> hfirst() {
	return dao.hfirst();
}
public List<HonorDTO> hsecond() {
	return dao.hsecond();
}
public List<HonorDTO> hthird() {
	return dao.hthird();
}
public List<HonorDTO> list(HonorDTO dto)throws Exception{ 
	return dao.list(dto);
}
public int man(String nickname) throws Exception{
	return dao.man(nickname);
}
public List<HonorDTO> honormember() throws Exception{
	return dao.honormember();
}
public int enter(HonorListDTO dto) throws Exception {
	return dao.enter(dto);
}
public List<HonorListDTO> enterhonorlist() throws Exception{
	return dao.enterhonorlist();
}
}
