package kh.picsell.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dao.ContestDAO;
import kh.picsell.dto.ContestDTO;

@Service
public class ContestService {
	@Autowired
	private ContestDAO dao;

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
	public void enrollimg(MultipartFile[] files, ContestDTO dto, String contestpath, String nickname ) {
		System.out.println("contestseq" + dto.getContest_seq());
		System.out.println("title" + dto.getTitle());
		System.out.println("nickname" + nickname);
		File filepath = new File(contestpath);

		if(!filepath.exists()) {
			filepath.mkdir();
		}
		String oriName = "";
		String sysName = "";

		for(MultipartFile f : files) {
			HashMap<String,Object> map = new HashMap<>();
			oriName = f.getOriginalFilename();
			sysName = System.currentTimeMillis() + "_" + oriName;
			System.out.println("oriname:"+oriName);
			try {
				f.transferTo(new File(contestpath+"/"+sysName));
				dto.setEnroll_sysname(sysName);
				map.put("dto", dto);
				map.put("nickname", nickname);
				dao.enrollimg(map);
			}catch(Exception e) {
				e.printStackTrace();
			}

		}
	}
}