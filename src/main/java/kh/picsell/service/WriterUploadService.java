package kh.picsell.service;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	@Autowired
	HttpServletResponse response;

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
		dto.setNickname(nickname);

		String oriName = "";
		String sysName = "";
		File originaloutput;
		ArrayList<String> oriNamelist = new ArrayList<>();
		ArrayList<String> sysNamelist =  new ArrayList<>();
		String sysName_watermark ="";



		File originalfile = new File(path);

		if(!originalfile.exists()) {
			originalfile.mkdir();
		}

		//워터마크 파일 경로
		File output = new File(watermarkpath);
		if(!output.exists()) {
			output.mkdir();
		}

		//업로드한 이미지 가져와서 리스트에 차곡차곡 저장.
		try {
			//원본파일 파일경로
			for(MultipartFile f : file) {
				oriName = f.getOriginalFilename();
				sysName = System.currentTimeMillis() + "_" + oriName;
				oriNamelist.add(oriName);
				sysNamelist.add(sysName);
				//원본파일 경로+이름
				originaloutput = new File(path+"/"+sysName);
				//집어넣음
				f.transferTo(originaloutput);

				BufferedImage original = ImageIO.read(originaloutput);
				Graphics2D g2d = original.createGraphics();

				// initializes necessary graphic properties
				AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.8f);

				g2d.setComposite(alphaChannel);
				g2d.setColor(Color.white);
				double ratio = (double)80/1000;
				double fontsize = original.getWidth() * ratio;
				g2d.setFont(new Font("Arial", Font.BOLD, (int)fontsize));
				FontMetrics fontMetrics = g2d.getFontMetrics();
				Rectangle2D rect = fontMetrics.getStringBounds("PicSell", g2d);

				// calculates the coordinate where the String is painted
				int centerX = (original.getWidth() - (int) rect.getWidth()) / 2;
				int centerY = original.getHeight() / 2;

				// paints the textual watermark
				g2d.drawString("PicSell", centerX, centerY);


				sysName_watermark = "marked_" + sysName;

				File markedfile;
				markedfile = new File(output + "/" + sysName_watermark);

				ImageIO.write(original, "png", markedfile);

			}
		}catch(Exception e) {
			e.printStackTrace();
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
				byte[] xsimgBytes = decodeBase64ToBytes(request.getParameter("xswatermark"+i));
				String xsSysName_watermark = "xsmarked_" + sysNamelist.get(i);
				FileOutputStream xsfis = new FileOutputStream(output + "/" + xsSysName_watermark);
				DataOutputStream xsdos = new DataOutputStream(xsfis);
				xsdos.write(xsimgBytes);
				xsdos.flush();
				xsdos.close();

				//파일이름저장
				dto.setOriname(oriNamelist.get(i));
				dto.setSysname(sysNamelist.get(i));

				//확장자저장
				Pattern p = Pattern.compile("(png|jpeg|jpg|PNG|JPG|JPEG)$");
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
					tag += "#"+taglist[j]+"#";
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