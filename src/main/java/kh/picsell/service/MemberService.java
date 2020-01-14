package kh.picsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.MemberDAO;
import kh.picsell.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public int insert(MemberDTO dto) throws Exception{ //회원가입
		return dao.insert(dto);
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
	public int login(String id, String pw) throws Exception{ //로그인
		System.out.println(id+" : "+pw);
		return dao.login(id, pw);
	}
	public int managercheck(String id, String pw) throws Exception{ //관리자인지체크
		return dao.managercheck(id, pw);
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
		System.out.println("서비스");
		System.out.println("dao : "+dao.pwmodify(pw, id, email));
		return dao.pwmodify(pw, id, email);
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
