package kh.picsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.HonorDAO;
import kh.picsell.dto.HonorDTO;
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
}
