package kh.picsell.dao;

import java.math.BigInteger;
import java.security.MessageDigest;

import org.springframework.stereotype.Repository;

@Repository
public class MyUtilsDAO {
	
	public static String getSHA512(String input) {
		String toReturn = null;
	try {
	      MessageDigest digest = MessageDigest.getInstance("SHA-512");
	      digest.reset();
	      digest.update(input.getBytes("utf8"));
	     toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
	   
	}catch (Exception e) {
		e.printStackTrace();
	}
	return toReturn;
	}
	
	public String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		return result;
	}
	
}
