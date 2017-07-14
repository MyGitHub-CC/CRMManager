package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import entity.User;

@Controller
public class IndexController {

	@RequestMapping(value="index", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView index(HttpServletRequest request) {
//		User user = (User)request.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView("index/index");
//		if (user != null) {
//			mv.setViewName("index/index");
//		} else {
//			mv.setViewName("login/login");
//		}
		return mv;
	}
	
	@RequestMapping(value="welcome", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView welcome() {
		ModelAndView mv = new ModelAndView("index/welcome");
		return mv;
	}
	
	@RequestMapping(value="addC", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addC() {
		ModelAndView mv = new ModelAndView("talkRecord/addTalkRecord");
		return mv;
	}
}
