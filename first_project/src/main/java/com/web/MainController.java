package main.java.com.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.json.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import main.java.com.service.MainService;

@Controller
public class MainController {

	@Resource(name = "mainService")
	private MainService mainService;

	@RequestMapping(value = "/")
	public String test(Model model) throws Exception {
		System.out.println("controller");
		String test = mainService.selectTest();
		System.out.println(test);
		model.addAttribute("selectTableList", test);
		return "main/Main";
	}

	@RequestMapping(value = "/parameter02")
	public String test1(HttpServletRequest reauest) throws Exception {
		ModelAndView mav = new ModelAndView();

		String adress = reauest.getParameter("adress");
		System.out.println(adress);

		mav.addObject("adress", adress);

		return "main/parameter02";
	}


}