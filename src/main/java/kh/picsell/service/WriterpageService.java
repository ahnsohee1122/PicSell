package kh.picsell.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.WriterImageUpDAO;
import kh.picsell.dto.MemberDTO;
import kh.picsell.dto.WriterImageUpDTO;

@Service
public class WriterpageService {
	
	@Autowired
	private WriterImageUpDAO dao;
	
	public List<WriterImageUpDTO> writerview (Map<String,Object> param) {
		return dao.view(param);
	}
	
	public MemberDTO writerInfo(String nickname) {
		return dao.writerInfo(nickname);
		
	}
	
	public Map<String,Integer> imginfo(String nickname){
		Map<String,Integer> info = new HashMap<>();
			info.put("imgcount", dao.imgcount(nickname));
			info.put("downcount", dao.downcount(nickname));
			info.put("viewcount", dao.viewcount(nickname));
			info.put("imglike", dao.imglike(nickname));
			info.put("likepoint", dao.likepoint(nickname));
			return info;
	}
	

}
