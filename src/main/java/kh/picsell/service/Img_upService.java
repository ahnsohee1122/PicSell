package kh.picsell.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.img_upDAO;
import kh.picsell.dto.img_upDTO;

@Service
public class Img_upService {
	@Autowired
	private HttpSession session;

	@Autowired
	private img_upDAO dao;
	
	public List<img_upDTO> getNoList() throws Exception{ //승인안된페이지
		return dao.getNoList();
	}
	public int accept(int img_seq) throws Exception{ //승인
		return dao.accept(img_seq);
	}
	public int noaccept(int img_seq) throws Exception{ //삭제
		return dao.noaccept(img_seq);
	}
	public List<img_upDTO> acceptpage(String nickname) throws Exception{
		return dao.acceptpage(nickname);
	}
	public int delete(int img_seq) throws Exception{
		return dao.delete(img_seq);
	}
	public int showok(String nickname) throws Exception{
		return dao.showok(nickname);
	}
	public int showno(String nickname) throws Exception{
		return dao.showno(nickname);
	}
	public int notyet(String nickname) throws Exception{
		return dao.notyet(nickname);
	}
}
