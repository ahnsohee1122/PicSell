package kh.picsell.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.ContestDTO;

@Repository
public class ContestDAO {
@Autowired
private SqlSessionTemplate jdbc;

//새로운 공모전 신청하기.
public int insert(ContestDTO dto) {
   return jdbc.insert("Contest.insert", dto);
}
//새 공모전 신청시 파일 업로드
public int fileinsert(ContestDTO dto) {
   return jdbc.insert("Contest.fileinsert",dto);
}
//파일 업로드시 parent 신청글 번호.
public int getcurrval() {
   return jdbc.selectOne("Contest.getcurrval");
}

public List<ContestDTO> notyetList() throws Exception{ //승인안된공모전조회
   return jdbc.selectList("Contest.getNoList");
}
public ContestDTO detailcheck(int contest_seq) throws Exception{//승인안된공모전내용보기
   return jdbc.selectOne("Contest.detailcheck",contest_seq);
}
public int accept(String accept_date, int contest_seq) throws Exception{//승인
   ContestDTO dto = new ContestDTO();
   dto.setAccept_date(accept_date);
   dto.setContest_seq(contest_seq);
   return jdbc.update("Contest.accept",dto);
}
public int acceptno(String rejection, int contest_seq) throws Exception{
   ContestDTO dto = new ContestDTO();
   dto.setRejection(rejection);
   dto.setContest_seq(contest_seq);
   return jdbc.update("Contest.acceptno",dto);
}
public List<ContestDTO> acceptList() throws Exception{ //승인된 공모전
   return jdbc.selectList("Contest.acceptlist");
}

public List<ContestDTO> contestchecking(String host) throws Exception{
   return jdbc.selectList("Contest.contestchecking",host);
}


public List<ContestDTO> exampleimg(int contest_seq){
   return jdbc.selectList("Contest.exampleimg",contest_seq);

}
public int showok(String host)throws Exception{
   return jdbc.selectOne("Contest.showok", host);
}
public int showno(String host)throws Exception{
   return jdbc.selectOne("Contest.showno", host);
}
public int notyet(String host)throws Exception{
   return jdbc.selectOne("Contest.notyet",host);
}

public List<ContestDTO> lastContest(){
	return jdbc.selectList("Contest.lastcontest");
}
}