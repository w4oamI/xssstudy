package org.alpreah.demo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.alpreah.domain.board;
import org.alpreah.domain.member;
import org.alpreah.persistence.board_dao;
import org.alpreah.persistence.member_dao;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.AbstractJsonpResponseBodyAdvice;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class HomeController {
	
	@Inject
	private member_dao m_dao;
	
	@Inject
	private board_dao b_dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "Login", method = RequestMethod.POST)
//	public int login(member m, HttpSession session, String m_id) {
//		System.out.println(m_id);
//		return m_dao.Login(m, session);
//	}
	
	@RequestMapping(value = "Login", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Resource> test(HttpServletRequest req)throws IOException{
		System.out.println(readBody(req));
		return null;
	}
	public int login(member m, HttpSession session, String m_id) {
		System.out.println(m_id);
		return m_dao.Login(m, session);
	}
	public static String readBody(HttpServletRequest request) throws IOException {
        BufferedReader input = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder builder = new StringBuilder();
        String buffer;
        while ((buffer = input.readLine()) != null) {
            if (builder.length() > 0) {
                builder.append("\n");
            }
            builder.append(buffer);
        }
        return builder.toString();
}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "register";
	}
	
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public int register(member m) {
		return m_dao.Register(m);
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String index(member m) {
		return "index";
	}
	
	@RequestMapping(value = "/index")
	public String index1(HttpServletRequest reauest) throws Exception {
		return "index";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("m");
		return "redirect:/";
	}
	
//	@RequestMapping(value = "/board_wrtie", method = RequestMethod.GET)
//	public String board_wrtie() {
//		return "board_wrtie";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/board_wrtie", method = RequestMethod.POST)
//	public int board_wrtie(HttpSession session, board b) {
//		member m = (member) session.getAttribute("m");
//		if(m == null) return -1;
//		b.setB_owner(m.getM_no());
//		return b_dao.board_write(b);
//	}
//	
//	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
//	public String board_list() {
//		return "board_list";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/get_board", method = RequestMethod.GET)
//	public List<board> get_board() {
//		return b_dao.get_board();
//	}
	
	
	

	@ControllerAdvice
	public class JsonpAdviceController extends AbstractJsonpResponseBodyAdvice {
		public JsonpAdviceController() {
			super("callback");
		}
	}

	@Bean
	public MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter() {
		MappingJackson2HttpMessageConverter jsonConverter = new MappingJackson2HttpMessageConverter();
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		jsonConverter.setObjectMapper(objectMapper);
		return jsonConverter;
	}

}
