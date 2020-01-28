package kh.picsell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.DeleteDAO;

@Service
public class DeleteService {
@Autowired
private DeleteDAO dao;

public int delete1(String nickname) throws Exception{
	return dao.delete1(nickname);
}
public int delete2(String nickname)throws Exception{
	return dao.delete2(nickname);
}
public int delete3(String nickname)throws Exception{
	return dao.delete3(nickname);
}
public int delete4(String nickname)throws Exception{
	return dao.delete4(nickname);
}
public int delete5(String nickname)throws Exception{
	return dao.delete5(nickname);
}
public int delete6(String nickname)throws Exception{
	return dao.delete6(nickname);
}
public int delete7(String nickname)throws Exception{
	return dao.delete7(nickname);
}
public int delete8(String nickname)throws Exception{
	return dao.delete8(nickname);
}
public int delete9(String nickname)throws Exception{
	return dao.delete9(nickname);
}
public int delete10(String nickname)throws Exception{
	return dao.delete10(nickname);
}
public int delete11(String nickname)throws Exception{
	return dao.delete11(nickname);
}
public int delete12(String nickname)throws Exception{
	return dao.delete12(nickname);
}
public int delete13(String nickname)throws Exception{
	return dao.delete13(nickname);
}
public int delete14(String nickname)throws Exception{
	return dao.delete14(nickname);
}
public int delete15(String nickname)throws Exception{
	return dao.delete15(nickname);
}

}
