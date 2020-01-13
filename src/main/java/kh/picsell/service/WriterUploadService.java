package kh.picsell.service;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dao.WriterImageUpDAO;
import kh.picsell.dto.WriterImageUpDTO;

@Service
public class WriterUploadService {

	@Autowired
	private HttpSession session;
	@Autowired
	private WriterImageUpDAO dao;
	
	
	private static final String BASE_64_PREFIX = "data:image/png;base64,";
	//jsp로 부터 받은 이미지 디코딩. - 앞에 data:image/png;base64, 을 제외하고 사용해야함.
    public static byte[] decodeBase64ToBytes(String imageString) {
        if (imageString.startsWith(BASE_64_PREFIX))
            return Base64.getDecoder().decode(imageString.substring(BASE_64_PREFIX.length()));
        else
            throw new IllegalStateException("it is not base 64 string");
    }
    
    @Transactional("txManager")
    public void upload(MultipartFile[] file, HttpServletRequest request, WriterImageUpDTO dto, String path, String watermarkpath,String nickname) {
		dto.setNickname("@"+nickname);
		File filepath = new File(path);
		File watermarkfilepath = new File(watermarkpath);

		if(!filepath.exists()) {
			filepath.mkdir();
		}
		if(!watermarkfilepath.exists()) {
			watermarkfilepath.mkdir();
		}
		//업로드한 이미지 가져와서 리스트에 차곡차곡 저장.
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
		
		String usage="";
		String[] taglist = new String[] {};
		String a = dto.getCopyright();
		
		//파일개수만큼 반복문 돌려서 각 이미지마다 딸려있는 데이터를 db에 저장.
		try {
		for(int i = 0; i<file.length; i++) {
			
			//워터마크 처리한 이미지 저장.
			//디코딩한 파일 byte배열로 가져와서 이름앞에 marked_ 붙혀서 watermarkfilepath에 저장. 
			byte[] imgBytes = decodeBase64ToBytes(request.getParameter("watermark"+i));
			String sysName_watermark = "marked_" + sysNamelist.get(i);
			FileOutputStream fis = new FileOutputStream(watermarkfilepath + "/" + sysName_watermark);
			DataOutputStream dos = new DataOutputStream(fis);
            dos.write(imgBytes);
            dos.flush();
            dos.close();
            dto.setSysname_watermark(sysName_watermark);
            
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
		
		}catch(Exception e) {
			e.printStackTrace();
			
		}

	}
}
