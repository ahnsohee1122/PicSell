package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.WriterImageUpDTO;

@Repository
public class SearchDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<WriterImageUpDTO> search(String tag){
		return jdbc.selectList("Search.search", tag);
	}
	
	public List<WriterImageUpDTO> align(int start, int end, String tag, String file_extension, String usage, String orderBy, String keyword2){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("tag", tag);
		map.put("file_extension", file_extension);
		map.put("usage", usage);
		map.put("orderBy", orderBy);
		map.put("keyword2", keyword2);
		return jdbc.selectList("Search.align", map);
	}

}
