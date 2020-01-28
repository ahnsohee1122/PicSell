package kh.picsell.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.picsell.dto.MemberDTO;


@Repository
public class MemberDAO {
//	@Autowired
//	private JdbcTemplate jdbc;
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int insert(MemberDTO dto) throws Exception{ //회원가입
		System.out.println("b" + dto.getPw());
		return jdbc.insert("Member.insert", dto);
	}
	public int idCheck(String id) throws Exception{ //아이디중복체크
		return jdbc.selectOne("Member.idCheck", id);
	}
	public int mailCheck(String email)throws Exception{ //메일중복체크
		return jdbc.selectOne("Member.mailCheck",email);
	}
	public int nicknameCheck(String nickname) throws Exception{ //닉네임중복체크
		return jdbc.selectOne("Member.nickCheck", nickname);
	}
	public int nicknameCheck2(String nickname) throws Exception{ //닉네임중복체크
		return jdbc.selectOne("Member.nickcheck2", nickname);
	}
	public int login(String id, String pw) throws Exception{  //로그인
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		return jdbc.selectOne("Member.login",dto);
	}
	public int managercheck(String id, String pw) throws Exception{ //관리자인지 체크
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		return jdbc.selectOne("Member.managercheck",dto);
	}
	public MemberDTO findid(String name, String email) throws Exception{ //아이디찾기(이름, 이메일로)
		Map<String,String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email",email);
		return jdbc.selectOne("Member.getid", map);
	}
	public MemberDTO getnick(String id) throws Exception{ //로그인할때 세션값으로쓸 닉네임가져오기
		return jdbc.selectOne("Member.getnick",id);
	}
	public MemberDTO getblack(String id) throws Exception{ //로그인시 블랙확인
		return jdbc.selectOne("Member.getblack", id);
	}
	public MemberDTO getblacknick(String nickname) throws Exception{ //로그인후 홈에서 닉네임세션값으로 블랙확인
		return jdbc.selectOne("Member.getblack-nick", nickname);
	}
	public int leave(String nickname) throws Exception{ //회원탈퇴
		return jdbc.delete("Member.leave",nickname);
	}
	public int changemem(String nickname) throws Exception{
		return jdbc.update("Member.changeimgmem",nickname);
	}
	public int pwmodify(String pw, String id, String email) throws Exception{ //패스워드 메일인증후 인증코드로 비번변경
		//System.out.println(dto.getPw());
		Map<String,String> map = new HashMap<String, String>();
		map.put("pw", pw);
		map.put("id", id);
		map.put("email",email);
		int result = jdbc.update("Member.pwmodify", map);
		if(result>0) {
			return 1;
		}else {
			return 0;
		}
	
	}
	public List<MemberDTO> list() throws Exception{ //관리자아닌 일반회원 리스트
		return jdbc.selectList("Member.list");
	}
	public int blackup(String id) throws Exception{ //블랙1업
		return jdbc.update("Member.blackup", id);
	}
	public int blackdown(String id) throws Exception{ //블랙1다운
		return jdbc.update("Member.blackdown", id);
	}
	
}
