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
	
	public Object adminCheck(ProceedingJoinPoint pjp) {
		Object result = null;
		Object adminInfo = session.getAttribute("adminInfo");
		System.out.println("zz");

		if(adminInfo != null) {
			try {
				System.out.println("a");
				result = pjp.proceed(pjp.getArgs());
				System.out.println("b");
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