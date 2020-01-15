package kh.picsell.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	public String modiprofileimg(MultipartFile file, String path, String nickname) {
		MemberDTO dto = new MemberDTO();
		dto.setNickname(nickname);
		File filepath = new File(path);
		
		if(!filepath.exists()) {
			filepath.mkdir();
		}
		
		String oriName = "";
		String sysName = "";
		
			oriName = file.getOriginalFilename();
			System.out.println(oriName);
			sysName = System.currentTimeMillis() + "_" + oriName;
			dto.setProfileimg(sysName);
			try {
				file.transferTo(new File(path+"/"+sysName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			myInfoDao.modiprofileimg(dto);
			return "/profileimage/"+sysName;
		}
	
		
	}
