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
	
	public WriterImageUpDTO getDetailImage(int img_seq) {
		return jdbc.selectOne("Search.getDetailImage", img_seq);
	}
	
	public int getLikepoint(String nickname) { // 작가 좋아요 개수 구하기
		return jdbc.selectOne("Search.getLikepoint", nickname);
	}
	
	public int photolike(int img_seq, int count) { // 이미지 좋아요 up & down
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("img_seq", img_seq);
		map.put("count", count);
		return jdbc.update("Search.photolike", map);
	}
	
	public int updateViewCount(int img_seq) {
		return jdbc.update("Search.updateViewCount", img_seq);
	}
	
	public int writerlike(String nickname, int count) { // 작가 좋아요 up & down		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nickname", nickname);
		map.put("count", count);
		return jdbc.update("Search.writerlike", map);
	}
	
	public int writerexist(String writer) {
		return jdbc.selectOne("Search.writerexist", writer);
	}
	
	//******************************
	public int likeStatus(int img_seq, String viewer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("img_seq", img_seq);
		map.put("viewer", viewer);
		return jdbc.selectOne("Search.likeStatus", map);
	}
	
	public int insertLikeList(int img_seq, String viewer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("img_seq", img_seq);
		map.put("viewer", viewer);
		return jdbc.insert("Search.insertLikeList", map);
	}
	
	public int deleteLikeList(int img_seq, String viewer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("img_seq", img_seq);
		map.put("viewer", viewer);
		return jdbc.delete("Search.deleteLikeList", map);
	}
	
	public int writerLikeStatus(String nickname, String viewer) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("writer", nickname);
		map.put("nickname", viewer);
		return jdbc.selectOne("Search.writerLikeStatus", map);
	}
	
	public int insertWriterLikeList(String nickname, String viewer) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("writer", nickname);
		map.put("nickname", viewer);
		return jdbc.insert("Search.insertWriterLikeList", map);
	}
	
	public int deleteWriterLikeList(String nickname, String viewer) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("writer", nickname);
		map.put("nickname", viewer);
		return jdbc.delete("Search.deleteWriterLikeList", map);
	}
	//******************************


}
