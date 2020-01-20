package kh.picsell.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.WriterImageUpDTO;

@Repository
public class img_upDAO {
	@Autowired
	private SqlSessionTemplate jdbc;
	public List<WriterImageUpDTO> getNoList() throws Exception{ //승인안된사진목록
		return jdbc.selectList("Img.getNoList");
	}
	public List<WriterImageUpDTO> getYesList() throws Exception{ //승인된사진목록
		return jdbc.selectList("Img.getYesList");
	}
	public int accept(int img_seq) throws Exception{ //승인하기
		return jdbc.update("Img.accept", img_seq);
	}
	public int noaccept(String rejection, int img_seq) throws Exception{
		WriterImageUpDTO dto = new WriterImageUpDTO();
		dto.setRejection(rejection);
		dto.setImg_seq(img_seq);
		return jdbc.update("Img.noaccept", dto);
	}
	public List<WriterImageUpDTO> acceptpage(String nickname){
		return jdbc.selectList("Img.acceptpage",nickname);
	}
	public int delete(int img_seq) throws Exception{
		return jdbc.delete("Img.delete",img_seq);
	}
	public int showok(String nickname) throws Exception{
		return jdbc.selectOne("Img.showok",nickname);
	}
	public int showno(String nickname) throws Exception{
		return jdbc.selectOne("Img.showno",nickname);
	}
	public int notyet(String nickname) throws Exception{
		return jdbc.selectOne("Img.notyet",nickname);
	}
	public WriterImageUpDTO detailview(int img_seq) throws Exception{
		return jdbc.selectOne("Img.detailview",img_seq);
	}
	
}
