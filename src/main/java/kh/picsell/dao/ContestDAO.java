package kh.picsell.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.ContestDTO;

@Repository
public class ContestDAO {
@Autowired
private SqlSessionTemplate jdbc;

public List<ContestDTO> notyetList() throws Exception{ //승인안된공모전조회
	return jdbc.selectList("Contest.getNoList");
}
public ContestDTO detailcheck(int contest_seq) throws Exception{//승인안된공모전내용보기
	return jdbc.selectOne("Contest.detailcheck",contest_seq);
}
public int accept(int contest_seq) throws Exception{//승인
	return jdbc.update("Contest.accept",contest_seq);
}
public int acceptno(int contest_seq) throws Exception{
	return jdbc.update("Contest.acceptno",contest_seq);
}
public List<ContestDTO> acceptList() throws Exception{ //승인된 공모전
	return jdbc.selectList("Contest.acceptlist");
}
}
