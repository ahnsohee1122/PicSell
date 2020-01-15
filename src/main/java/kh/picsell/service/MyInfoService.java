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
		System.out.println("a");
		return myInfoDao.myInfo(nickName);
	}
	
	public MemberDTO infoModify(String nickName) {
		System.out.println("b");
		return myInfoDao.myInfo(nickName);
	}
	
	public void infoModifyProc(MemberDTO memberDto) {
		myInfoDao.infoModifyProc(memberDto);
	}
	
	public String currentPwCheck(String nickname) {
		return myInfoDao.currentPwCheck(nickname);
	}
	
	public void modifyPwProc(String pw, String nickname) {
		myInfoDao.modifyPwProc(pw, nickname);
	}
	
//	public void modifyInfo(String nick, MemberDTO dto) {
//		myInfoDao.modifyInfo(nick, dto);
//	}

}
