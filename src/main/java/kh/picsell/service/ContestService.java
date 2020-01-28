package kh.picsell.service;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dao.ContestDAO;
import kh.picsell.dao.MoneyDAO;
import kh.picsell.dto.ContestDTO;

@Service
public class ContestService {
	@Autowired
	private ContestDAO dao;

	@Autowired
	private MoneyDAO moneydao;

	public List<ContestDTO> notyetList() throws Exception{
		return dao.notyetList();
	}

	public ContestDTO detailcheck(int contest_seq) throws Exception{
		return dao.detailcheck(contest_seq);
	}

	public int accept(String accept_date, int contest_seq) throws Exception{
		
		System.out.println("공모전 :" + contest_seq);
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String deal_date = sdf.format(today);
		
		//공모전정보가져오기
		ContestDTO dto = dao.detailcheck(contest_seq);
		System.out.println(dto.getPrice());
		String nickname = dto.getHost();
		System.out.println(nickname);
		moneydao.pointUpdate(nickname, "공모전상금", deal_date, dto.getPrice(), "포인트");
		
		return dao.accept(accept_date, contest_seq);
	}

	public int noaccept(String rejection, int contest_seq) throws Exception {
		return dao.acceptno(rejection, contest_seq);
	}

	public List<ContestDTO> acceptList() throws Exception{
		return dao.acceptList();
	}
	public List<ContestDTO> contestchecking(String host) throws Exception{
		return dao.contestchecking(host);
	}

	public List<ContestDTO> exampleimg(int contest_seq) throws Exception {
		return dao.exampleimg(contest_seq);
	}

	@Transactional("txManager")
	public void newcontest(MultipartFile[] file, ContestDTO dto, String path, String nickname, String adminInfo) {
		if(adminInfo != null) {
			dto.setHost(adminInfo);
		}else {
			dto.setHost(nickname);			
		}
		dto.setTerms(dto.getTerms().replaceAll("\r\n", "<br>"));
		dto.setDetail(dto.getDetail().replaceAll("\r\n", "<br>"));
		dao.insert(dto);

		File filepath = new File(path);   
		int currval = dao.getcurrval();

		if(!filepath.exists()) {
			filepath.mkdir();
		}

		String oriname = "";
		String sysname = "";

		for(MultipartFile f : file) {
			try {
				oriname = f.getOriginalFilename();
				sysname = dto.getHosttype()+"_"+System.currentTimeMillis() + "_" + oriname;
				dto.setOriname(oriname);
				dto.setSysname(sysname);
				dto.setContest_seq(currval);
				f.transferTo(new File(path+"/"+sysname));
				int a = dao.fileinsert(dto);
				System.out.println(a);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}



	}
	public int showok(String host) throws Exception{
		return dao.showok(host);
	}
	public int showno(String host)throws Exception{
		return dao.showno(host);
	}
	public int notyet(String host)throws Exception{
		return dao.notyet(host);
	}
	public List<ContestDTO> lastContest(){
		return dao.lastContest();
	}
	public int selecting(int contest_seq) throws Exception{
		return dao.selecting(contest_seq);
	}
	public List<ContestDTO> ing() throws Exception{
		return dao.ing();
	}
	public List<ContestDTO> selectlist(int contest_seq) throws Exception{
		return dao.selectlist(contest_seq);
	}
	@Transactional("txManager")
	public void enrollimg(MultipartFile[] files, ContestDTO dto, String contestpath) {

		File originalfile = new File(contestpath);
		File originaloutput;
		if(!originalfile.exists()) {
			originalfile.mkdir();
		}
		String oriName = "";
		String sysName = "";
		
		String mainPosition = "W";
		int newWidth = 600;                                  // 변경 할 넓이
        int newHeight = 400;
        int w ;
        int h;

		for(MultipartFile f : files) {
			HashMap<String,Object> map = new HashMap<>();
			oriName = f.getOriginalFilename();
			sysName = System.currentTimeMillis() + "_" + oriName;

			try {
				originaloutput = new File(contestpath+"/"+sysName);
				f.transferTo(originaloutput);

				BufferedImage original = ImageIO.read(originaloutput);
				
				int imageWidth = original.getWidth(null);
	            int imageHeight = original.getHeight(null);
				System.out.println("imgewidth:" + imageWidth);
				System.out.println("imageHeight:" + imageHeight);
	            if(mainPosition.equals("W")){    // 넓이기준
	            	 
	               double ratio = (double)newWidth/(double)imageWidth;
	                w = (int)(imageWidth * ratio);
	               h = (int)(imageHeight * ratio);
	 
	            }else if(mainPosition.equals("H")){ // 높이기준
	 
	                double ratio = (double)newHeight/(double)imageHeight;
	               w = (int)(imageWidth * ratio);
	               h = (int)(imageHeight * ratio);
	 
	            }else{ //설정값 (비율무시)
	 
	                w = newWidth;
	                h = newHeight;
	            }
				
	         // 이미지 리사이즈
	            // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
	            // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
	            // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
	            // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
	            // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
	            Image resizeImage = original.getScaledInstance(w, h, Image.SCALE_SMOOTH);
	            BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
	            Graphics g = newImage.getGraphics(); 
	            g.drawImage(resizeImage, 0, 0, null); 
	            g.dispose();

				
				
				
				
				Graphics2D g2d = newImage.createGraphics();

				AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.8f);

				g2d.setComposite(alphaChannel);
				g2d.setColor(Color.white);
				double ratio = (double)30/1000;
				double fontsize = newImage.getWidth() * ratio;
				g2d.setFont(new Font("Arial", Font.BOLD, (int)fontsize));
				FontMetrics fontMetrics = g2d.getFontMetrics();
				Rectangle2D rect = fontMetrics.getStringBounds("PicSell", g2d);

				// calculates the coordinate where the String is painted
				int centerX = (newImage.getWidth() - (int) rect.getWidth()) / 2;
				int centerY = newImage.getHeight() / 2;


				// paints the textual watermark
				g2d.drawString("PicSell", centerX, centerY);

				String sysName_watermark;
				sysName_watermark = "marked_" + sysName;

				File markedfile;
				markedfile = new File(originalfile+ "/" + sysName_watermark);

				String ori_sysName_watermark;
				ori_sysName_watermark = "orimarked_" + sysName;
				
				File orimarkedfile;
				orimarkedfile = new File(originalfile+ "/" + ori_sysName_watermark);
				
				ImageIO.write(original,"png",orimarkedfile);
				ImageIO.write(newImage, "png", markedfile);
				dto.setEnroll_sysname(sysName);
				map.put("dto", dto);
				dao.enrollimg(map);
			}catch(Exception e) {
				e.printStackTrace();
			}

		}
	}

	public List<ContestDTO> enrollList(int Contest_seq) {
		return dao.enrollList(Contest_seq);
	}

	public void selectedimage(String[] select) {
		for(String seq : select) {
			int contest_img_seq = Integer.parseInt(seq);
			dao.selectedimage(contest_img_seq);

		}

	}

	public List<ContestDTO> selected(int contest_seq){
		return dao.selected(contest_seq);
	}

	public ContestDTO enrollimagedetail(int contest_img_seq) {
		return dao.enrollimagedetail(contest_img_seq);
	}

	
	////////////////////////////////////////////
	//공모전 상금(수익금)지급
	@RequestMapping("ContestProfit")
	public void contestProfit(int contest_seq, String[] select) {

		for(String seq : select) {
			try {
				//선택된 사람 'Y'로 바꾸
				int contest_img_seq = Integer.parseInt(seq);
				dao.selectedimage(contest_img_seq);
				//작가정보
				ContestDTO detail = dao.enrollimagedetail(contest_img_seq);
				String writer_nickname = detail.getEnroll_nickname();

				// 날짜
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String deal_date = sdf.format(today);

				//공모전정보가져오기
				ContestDTO dto = dao.detailcheck(contest_seq);
				int headcount = Math.round(select.length);
				int pricePerPerson = dto.getPrice()/headcount;

				moneydao.insertBuyList(deal_date, pricePerPerson, 0, dto.getHost(), writer_nickname);
				moneydao.pointUpdate(writer_nickname, "공모전판매", deal_date, pricePerPerson,"수익금");
				moneydao.pointUpdate(dto.getHost(), "공모전구매",deal_date, -pricePerPerson, "포인트");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int totalContents(int contest_seq) {
		return dao.totalContents(contest_seq);
	}


	public List<ContestDTO> selectByPage(int start, int end) {
		Map<String,Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return dao.selectByPage(map);
	}





}