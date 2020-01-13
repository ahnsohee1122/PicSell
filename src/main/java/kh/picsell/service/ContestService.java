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

public int accept(int contest_seq) throws Exception{
	return dao.accept(contest_seq);
}

public int noaccept(int contest_seq) throws Exception {
	return dao.acceptno(contest_seq);
}

public List<ContestDTO> acceptList() throws Exception{
	return dao.acceptList();
}public List<ContestDTO> contestchecking(String host) throws Exception{
	return dao.contestchecking(host);
}

public List<ContestDTO> exampleimg(int contest_seq) throws Exception {
	return dao.exampleimg(contest_seq);
}

@Transactional("txManager")
public void newcontest(MultipartFile[] file, ContestDTO dto, String path) {
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
}