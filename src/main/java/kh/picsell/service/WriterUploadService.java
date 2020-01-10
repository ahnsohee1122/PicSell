package kh.picsell.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dao.WriterImageUpDAO;
import kh.picsell.dto.WriterImageUpDTO;

@Service
public class WriterUploadService {
	
	@Autowired
	private HttpSession session;

	@Autowired
	private WriterImageUpDAO dao;
	
	
	public void upload(MultipartFile[] file, HttpServletRequest request, WriterImageUpDTO dto) {
		
		
		String path = session.getServletContext().getRealPath("writeruploadfiles");
		
		File filepath = new File(path);
		
		if(!filepath.exists()) {
			filepath.mkdir();
		}
		String oriName = "";
		String sysName = "";
		ArrayList<String> oriNamelist = new ArrayList<>();
		ArrayList<String> sysNamelist =  new ArrayList<>();
		for(MultipartFile f : file) {
			oriName = f.getOriginalFilename();
			sysName = System.currentTimeMillis() + "_" + oriName;
			oriNamelist.add(oriName);
			sysNamelist.add(sysName);
			try {
				f.transferTo(new File(path+"/"+sysName));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		ArrayList<String> commerciallist = new ArrayList<>();
		ArrayList<String> urlList = new ArrayList<>();
		
		String usage="";
		String[] taglist = new String[] {};
		String a = dto.getCopyright();
		
		for(int i = 0; i<file.length; i++) {
			
			urlList.add(request.getParameter("watermark"+i));
			
			
			
			//파일이름저장
			dto.setOriname(oriNamelist.get(i));
			dto.setSysname(sysNamelist.get(i));
	
			//확장자저장
			Pattern p = Pattern.compile("\\..{3,4}$");
			Matcher m = p.matcher(oriNamelist.get(i));
			while(m.find()) {
				dto.setFile_extension(m.group(0));
				System.out.println(m.group(0));
			}
			
			//용도저장
			commerciallist.add(request.getParameter("p" + i + "-commercial"));
			usage = commerciallist.get(i);	
			dto.setUsage(usage);
			System.out.println(usage);
			
			//태그저장
			taglist = request.getParameterValues("p"+i+"-tags[]");
			String tag="";
			for(int j = 0; j<taglist.length; j++) {
				  tag += "{"+taglist[j]+"}";
				  dto.setTag(tag);
			}
			
			//저작권정보저장
			String[] copyright = a.split(",");
			dto.setCopyright(copyright[i]);
			
			if(dto.getModel()==null || dto.getMake() == null || dto.getxDimension() == null || dto.getyDimension() == null) {
				dto.setModel(null);
				dto.setMake(null);
				dto.setxDimension("0");
				dto.setyDimension("0");
			}
			System.out.println(dao.insert(dto));
		}
		

		
	}
	
	public List<WriterImageUpDTO> writerview (Map<String,Object> param) {
		return dao.view(param);
	}
}
