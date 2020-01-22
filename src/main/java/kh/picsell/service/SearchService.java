package kh.picsell.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.SearchDAO;
import kh.picsell.dto.WriterImageUpDTO;

@Service
public class SearchService {
	
	@Autowired
	private SearchDAO dao;
	
//	public List<WriterImageUpDTO> search(String tag) {
//		StringBuilder sb = new StringBuilder();
//		String[] arr = tag.split(" ");
//		for(String tmp : arr) {
//			sb.append("#"+tmp+"#|");
//		}
//		tag = sb.substring(0,sb.length()-1).toString();
//		System.out.println("tag!!!!!!!!!!!!!!!!!!!:" + tag);
//		List<WriterImageUpDTO> list = dao.search(tag);
//		return list;
//	}
	
	public List<WriterImageUpDTO> align(int start, int end, String tag, String file_extension, String usage, String orderBy, String keyword2){
		
//		int checkTag = 0;
//		int checkKeyword2 = 0;
//		
//		Pattern p = Pattern.compile("^\\s+.*$"); // 태그가 "     ㅇㅇㅇ" 처럼 공백+문자일 경우
//		Matcher m = p.matcher(tag);
//		
//		if(m.find()) {
//			tag="# #";
//			checkTag = 1;
//			System.out.println("keyword: " + tag);
//		}
//		
//		if(keyword2 != null) {
//			Matcher m2 = p.matcher(keyword2);
//			if(m2.find()){
//				keyword2="# #";
//				checkKeyword2 = 1;
//				System.out.println("keyword2: " + keyword2);
//			}
//		}
//		
//		if(checkTag != 1) {
//			StringBuilder sb = new StringBuilder();
//			String[] arr = tag.split(" ");
//			for(String tmp : arr) {
//				sb.append("#"+tmp+"#|");
//			}
//			tag = sb.substring(0,sb.length()-1).toString();
//			System.out.println("공백+문자 아닌 경우 keyword: " + tag);
//		}
//		
//		if(keyword2 != null) {
//			if(checkKeyword2 != 1) {
//				StringBuilder sb2 = new StringBuilder();
//				String[] arr2 = keyword2.split(" ");
//				for(String tmp : arr2) {
//					sb2.append("#"+tmp+"#|");
//				}
//				System.out.println(keyword2);
//				keyword2 = sb2.substring(0,sb2.length()-1).toString();
//				System.out.println("공백+문자 아닌 경우 keyword2: " + keyword2);
//			}
//		}
		
		Pattern p = Pattern.compile("[^a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣0-9 ]+");
		Matcher m = p.matcher(tag);
		if(m.find()) { // 특수문자를 포함하면
			tag = "# #";
		}else { // 특수문자 포함하지 않으면
			String[] arr = tag.split(" ");
			StringBuilder sb = new StringBuilder();
			for(String tmp : arr) {
				if(!tmp.contentEquals("")) {
					sb.append("#"+tmp+"#|");
				}
			}
			
			if(sb.length() == 0) {
				tag = "# #";
			}else {
				tag = sb.substring(0,sb.length()-1).toString();
			}
			
			if(keyword2 != null) {
				String[] arr2 = keyword2.split(" ");
				StringBuilder sb2 = new StringBuilder();
				for(String tmp : arr2) {
					if(!tmp.contentEquals("")) {
						sb2.append("#"+tmp+"#|");
					}
				}
				
				if(sb2.length() == 0) {
					keyword2 = "# #";
				}else {
					keyword2 = sb2.substring(0,sb2.length()-1).toString();
				}
			}
		}
		
//		String[] arr = tag.split(" ");
//		StringBuilder sb = new StringBuilder();
//		for(String tmp : arr) {
//			if(!tmp.contentEquals("")) {
//				sb.append("#"+tmp+"#|");
//			}
//		}
//		
//		if(sb.length() == 0) {
//			tag = "# #";
//		}else {
//			tag = sb.substring(0,sb.length()-1).toString();
//		}
//		
//		if(keyword2 != null) {
//			String[] arr2 = keyword2.split(" ");
//			StringBuilder sb2 = new StringBuilder();
//			for(String tmp : arr2) {
//				if(!tmp.contentEquals("")) {
//					sb2.append("#"+tmp+"#|");
//				}
//			}
//			
//			if(sb2.length() == 0) {
//				keyword2 = "# #";
//			}else {
//				keyword2 = sb2.substring(0,sb2.length()-1).toString();
//			}
//		}
		
		System.out.println("tag:"+tag);
		System.out.println("keyword2:"+keyword2);
		
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
