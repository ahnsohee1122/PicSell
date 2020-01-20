package kh.picsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.SearchDAO;
import kh.picsell.dto.WriterImageUpDTO;

@Service
public class SearchService {
	
	@Autowired
	private SearchDAO dao;
	
	public List<WriterImageUpDTO> search(String tag) {
		StringBuilder sb = new StringBuilder();
		String[] arr = tag.split(" ");
		for(String tmp : arr) {
			sb.append("#"+tmp+"#|");
		}
		tag = sb.substring(0,sb.length()-1).toString();
		System.out.println("tag!!!!!!!!!!!!!!!!!!!:" + tag);
		List<WriterImageUpDTO> list = dao.search(tag);
		return list;
	}
	
	public List<WriterImageUpDTO> align(int start, int end, String tag, String file_extension, String usage, String orderBy, String keyword2){
		StringBuilder sb = new StringBuilder();
		String[] arr = tag.split(" ");
		for(String tmp : arr) {
			sb.append("#"+tmp+"#|");
		}
		tag = sb.substring(0,sb.length()-1).toString();
		System.out.println("keyword: " + tag);
		
		if(keyword2 != null) {
			StringBuilder sb2 = new StringBuilder();
			String[] arr2 = keyword2.split(" ");
			for(String tmp : arr2) {
				sb2.append("#"+tmp+"#|");
			}
			System.out.println(keyword2);
			keyword2 = sb2.substring(0,sb2.length()-1).toString();
			System.out.println("keyword2: " + keyword2);
		}
	
		return dao.align(start, end, tag, file_extension, usage, orderBy, keyword2);
	}
	
	public WriterImageUpDTO getDetailImage(int img_seq) {
		return dao.getDetailImage(img_seq);
	}
	
	public int getLikepoint(String nickname) { // 작가 좋아요 개수 구하기
		return dao.getLikepoint(nickname);
	}
	
	public int photolike(int img_seq, int count) { // 이미지 좋아요 up & down		
		return dao.photolike(img_seq, count);
	}
	
	public int updateViewCount(int img_seq) {
		return dao.updateViewCount(img_seq);
	}
	
	public int writerlike(String nickname, int count) { // 작가 좋아요 up & down		
		return dao.writerlike(nickname, count);
	}
	
	public int writerexist(String writer) {
		return dao.writerexist(writer);
	}
	
	// *********************************
	public int likeStatus(int img_seq, String viewer) {
		return dao.likeStatus(img_seq, viewer);
	}
	
	public int insertLikeList(int img_seq, String viewer) {
		return dao.insertLikeList(img_seq, viewer);
	}
	
	public int deleteLikeList(int img_seq, String viewer) {
		return dao.deleteLikeList(img_seq, viewer);
	}
	
	public int writerLikeStatus(String nickname, String viewer) {
		return dao.writerLikeStatus(nickname, viewer);
	}
	
	public int insertWriterLikeList(String nickname, String viewer) {
		return dao.insertWriterLikeList(nickname, viewer);
	}
	
	public int deleteWriterLikeList(String nickname, String viewer) {
		return dao.deleteWriterLikeList(nickname, viewer);
	}
	// *********************************

}
