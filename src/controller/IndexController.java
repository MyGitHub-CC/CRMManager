package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping(value="index", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("index/index");
		return mv;
	}
	
	@RequestMapping(value="welcome", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView welcome() {
		ModelAndView mv = new ModelAndView("index/welcome");
		return mv;
	}
}
