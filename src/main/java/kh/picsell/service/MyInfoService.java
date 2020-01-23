package kh.picsell.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dao.MyInfoDAO;
import kh.picsell.dao.MyUtilsDAO;
import kh.picsell.dto.MemberDTO;

@Service
public class MyInfoService {
	
	@Autowired
	private MyUtilsDAO myDao;
	
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
	
	public String currentPwCheck(String nickname, String pw) {
		String inputPw = myDao.getSHA512(pw);
		String currentPw = myInfoDao.currentPwCheck(nickname);
		if(inputPw.contentEquals(currentPw)) {
			System.out.println("yes");
			return "yes";
		}else {
			System.out.println("no");
			return "no";
		}
	}
	
	public void modifyPwProc(String pw, String nickname) {
		String modifiedPw = myDao.getSHA512(pw);
		myInfoDao.modifyPwProc(modifiedPw, nickname);
	}

	
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
