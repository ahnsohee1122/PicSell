package kh.picsell.advisers;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

public class PerfAdviser {
	
	@Autowired
	private HttpSession session;
	
	public Object loginCheck(ProceedingJoinPoint pjp) {
		
		Object result = null;
		Object loginInfo = session.getAttribute("loginInfo");

		if(loginInfo != null) {
			try {
				result = pjp.proceed(pjp.getArgs());
			} catch (Throwable e) {
				e.printStackTrace();
				return "error";
			}
		}else {
			return "error";
		}
		return result;
	}

}
