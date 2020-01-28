package kh.picsell.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeleteDAO {
@Autowired
private SqlSessionTemplate jdbc;

public int delete1(String nickname) throws Exception{
	return jdbc.delete("Delete.memout",nickname);
}
public int delete2(String host) throws Exception{
	return jdbc.delete("Delete.conout",host);
}
public int delete3(String host) throws Exception{
	return jdbc.delete("Delete.contestfilesdelete",host);
}
public int delete4(String pieceNotice_writer) throws Exception{
	return jdbc.delete("Delete.piecedelete",pieceNotice_writer);
}
public int delete5(String writer) throws Exception{
	return jdbc.delete("Delete.piececomment",writer);
}
public int delete6(String editNotice_writer) throws Exception{
	return jdbc.delete("Delete.editNotice",editNotice_writer);
}
public int delete7(String writer) throws Exception{
	return jdbc.delete("Delete.editcomment",writer);
}
public int delete8(String nickname)throws Exception{
	return jdbc.delete("Delete.likelist", nickname);
}
public int delete9(String writer) throws Exception{
	return jdbc.delete("Delete.writerlikelist",writer);
}
public int delete10(String writer) throws Exception{
	return jdbc.delete("Delete.writerlikelist2",writer);
}
public int delete11(String nickname)throws Exception{
	return jdbc.delete("Delete.event",nickname);
}
public int delete12(String nickname)throws Exception{
	return jdbc.delete("Delete.point",nickname);
}
//public int delete13(String writer_nickname)throws Exception{
//	return jdbc.delete("Delete.deallist",writer_nickname);
//}
//public int delete14(String buyer_nickname)throws Exception{
//	return jdbc.delete("Delete.deallist2",buyer_nickname);
//}
public int delete13(String nickname)throws Exception{
	return jdbc.delete("Delete.honor",nickname);
}
public int delete14(String nickname)throws Exception{
	return jdbc.delete("Delete.honorlist",nickname);
}
public int delete15(String nick)throws Exception{
	return jdbc.delete("Delete.honorvote",nick);
}
}
