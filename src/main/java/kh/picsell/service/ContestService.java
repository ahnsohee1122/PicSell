package kh.picsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.ContestDAO;
import kh.picsell.dto.ContestDTO;

@Service
public class ContestService {
@Autowired
private ContestDAO dao;
public List<ContestDTO> notyetList() throws Exception{
	return dao.notyetList();
}public ContestDTO detailcheck(int contest_seq) throws Exception{
	return dao.detailcheck(contest_seq);
}public int accept(int contest_seq) throws Exception{
	return dao.accept(contest_seq);
}public int noaccept(int contest_seq) throws Exception {
	return dao.acceptno(contest_seq);
}
}
