package kh.picsell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.MyInfoDAO;
import kh.picsell.dto.MemberDTO;

@Service
public class MyInfoService {
	
	@Autowired
	private MyInfoDAO myInfoDao;

	public MemberDTO myInfo(String nickName) {
		return myInfoDao.myInfo(nickName);
	}
	
	public MemberDTO infoModify(String nickName) {
		return myInfoDao.myInfo(nickName);
	}
	
	public void infoModifyProc(MemberDTO memberDto) {
		myInfoDao.infoModifyProc(memberDto);
	}

}
