package kh.picsell.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KakaoController {
	
		
		@RequestMapping("/kakao")
		public String test() {
			return "kakaotest";
		}
}
