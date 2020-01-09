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
			sb.append("{"+tmp+"}|");
		}
		tag = sb.substring(0,sb.length()-1).toString();
		List<WriterImageUpDTO> list = dao.search(tag);
		return list;
	}
	
	public List<WriterImageUpDTO> align(int start, int end, String tag, String file_extension, String usage, String orderBy, String keyword2){
		StringBuilder sb = new StringBuilder();
		String[] arr = tag.split(" ");
		for(String tmp : arr) {
			sb.append("{"+tmp+"}|");
		}
		tag = sb.substring(0,sb.length()-1).toString();
		System.out.println("keyword: " + tag);
		
		if(keyword2 != null) {
			StringBuilder sb2 = new StringBuilder();
			String[] arr2 = keyword2.split(" ");
			for(String tmp : arr2) {
				sb2.append("{"+tmp+"}|");
			}
			System.out.println(keyword2);
			keyword2 = sb2.substring(0,sb2.length()-1).toString();
			System.out.println("keyword2: " + keyword2);
		}
	
		return dao.align(start, end, tag, file_extension, usage, orderBy, keyword2);
	}

}
