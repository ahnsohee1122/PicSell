package kh.picsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.picsell.dao.MemberDAO;
import kh.picsell.dao.MoneyDAO;
import kh.picsell.dao.MyUtilsDAO;
import kh.picsell.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	private MyUtilsDAO myDao;
	
	@Autowired
	private MemberDAO dao;

	@Autowired
	private MoneyDAO money_dao; 
	
	// 회원가입 + 회원가입 포인트 지급 
	@Transactional("txManager")
	public int insert(MemberDTO dto, String deal_sort, String point_date, int point, String money_sort) throws Exception{
		String modifyPw = myDao.getSHA512(dto.getPw());
		System.out.println("a" + modifyPw);
		dto.setPw(modifyPw);
		int result = 0; 
		int signup = dao.insert(dto);
		int signupPoint = money_dao.pointUpdate(dto.getNickname(), deal_sort, point_date, point, money_sort);
		if((signup>0)&&(signupPoint>0)) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}

	public int idCheck(String id) throws Exception{ //아디체크
		return dao.idCheck(id);
	}
	public int mailCheck(String email) throws Exception{ //메일체크
		return dao.mailCheck(email);
	}
	public int nickCheck(String nickname) throws Exception{ //닉체크
		return dao.nicknameCheck(nickname);
	}
	public int nickCheck2(String nickname) throws Exception{
		return dao.nicknameCheck2(nickname);
	}
	public int changemem(String nickname) throws Exception{
		return dao.changemem(nickname);
	}
	public int login(String id, String pw) throws Exception{ //로그인
		String modifyPw = myDao.getSHA512(pw);
		return dao.login(id, modifyPw);
	}
	public int managercheck(String id, String pw) throws Exception{ //관리자인지체크
		String modifyPw = myDao.getSHA512(pw);
		return dao.managercheck(id, modifyPw);
	}
	public MemberDTO getnick(String id)throws Exception{ //로그인시 세션값으로쓸 닉
		return dao.getnick(id);
	}
	public MemberDTO getblack(String id)throws Exception{ //아이디로 블랙조회(로그인시)
		return dao.getblack(id);
	}
	public MemberDTO getblacknick(String nickname)throws Exception{ //홈에서 블랙유무
		return dao.getblacknick(nickname);
	}
	public MemberDTO idfind(String name, String email) throws Exception{ //아디찾기
		return dao.findid(name, email);
	}
	public int pwchange(String pw, String id, String email) throws Exception{ //비번변경
		String modifyPw = myDao.getSHA512(pw);
		return dao.pwmodify(modifyPw, id, email);
	}
	public int memout(String nickname)throws Exception{ //회원탈퇴
		return dao.leave(nickname);
	}
	public List<MemberDTO> getList() throws Exception{ //회원목록조회
		return dao.list();
	}
	public int blackup(String id)throws Exception{ //블랙1업
		return dao.blackup(id);
	}
	public int blackdown(String id)throws Exception{ //블랙1다운
		return dao.blackdown(id);
	}
}
