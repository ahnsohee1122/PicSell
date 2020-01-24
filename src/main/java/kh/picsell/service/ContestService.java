package kh.picsell.service;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
	public void newcontest(MultipartFile[] file, ContestDTO dto, String path, String nickname) {
		dto.setHost(nickname);
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
				dao.fileinsert(dto);
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
	@Transactional("txManager")
	public void enrollimg(MultipartFile[] files, ContestDTO dto, String contestpath) {

		File originalfile = new File(contestpath);
		File originaloutput;
		if(!originalfile.exists()) {
			originalfile.mkdir();
		}
		String oriName = "";
		String sysName = "";

		for(MultipartFile f : files) {
			HashMap<String,Object> map = new HashMap<>();
			oriName = f.getOriginalFilename();
			sysName = System.currentTimeMillis() + "_" + oriName;

			try {
				originaloutput = new File(contestpath+"/"+sysName);
				f.transferTo(originaloutput);

				BufferedImage original = ImageIO.read(originaloutput);
				Graphics2D g2d = original.createGraphics();

				AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.8f);

				g2d.setComposite(alphaChannel);
				g2d.setColor(Color.white);
				double ratio = (double)30/1000;
				double fontsize = original.getWidth() * ratio;
				g2d.setFont(new Font("Arial", Font.BOLD, (int)fontsize));
				FontMetrics fontMetrics = g2d.getFontMetrics();
				Rectangle2D rect = fontMetrics.getStringBounds("PicSell", g2d);

				// calculates the coordinate where the String is painted
				int centerX = (original.getWidth() - (int) rect.getWidth()) / 2;
				int centerY = original.getHeight() / 2;


				// paints the textual watermark
				g2d.drawString("PicSell", centerX, centerY);

				String sysName_watermark;
				sysName_watermark = "marked_" + sysName;

				File markedfile;
				markedfile = new File(originalfile+ "/" + sysName_watermark);

				ImageIO.write(original, "png", markedfile);
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

//	public void selectedimage(String[] select) {
//		for(String seq : select) {
//			int contest_img_seq = Integer.parseInt(seq);
//			dao.selectedimage(contest_img_seq);
//
//		}
//
//	}

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
				int headcount = select.length;
				int pricePerPerson = dto.getPrice()/headcount;
				System.out.println("인당가격" + pricePerPerson);
				System.out.println(dto.getHost());

				moneydao.insertBuyList(deal_date, pricePerPerson, 0, dto.getHost(), writer_nickname);
				moneydao.pointUpdate(writer_nickname, "구매", deal_date, pricePerPerson,"수익금");
				moneydao.pointUpdate(dto.getHost(), "판매",deal_date, -pricePerPerson, "수익금");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}










}