package kh.picsell.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.img_upDAO;
import kh.picsell.dto.WriterImageUpDTO;

@Service
public class Img_upService {
	@Autowired
	private HttpSession session;

	@Autowired
	private img_upDAO dao;

	public List<WriterImageUpDTO> getNoList() throws Exception{ //승인안된페이지
		return dao.getNoList();
	}
	public int accept(int img_seq) throws Exception{ //승인
		return dao.accept(img_seq);
	}
	public int noaccept(String rejection, int img_seq) throws Exception{ //삭제
		return dao.noaccept(rejection, img_seq);
	}
	public List<WriterImageUpDTO> acceptpage(String nickname) throws Exception{ //마이페이지에서 조회
		return dao.acceptpage(nickname);
	}
	public int delete(int img_seq, String path) throws Exception{
		WriterImageUpDTO dto = dao.detailview(img_seq);
		File file = new File(path+"/"+dto.getSysname());

		if(file.exists()){ 
			
			if(file.delete()){ 
				System.out.println("파일삭제 성공"); 
			}else{ System.out.println("파일삭제 실패"); 
			} 
		}else{ System.out.println("파일이 존재하지 않습니다."); 
		} 


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
public WriterImageUpDTO detailview(int img_seq) throws Exception{
	return dao.detailview(img_seq);
}
}
