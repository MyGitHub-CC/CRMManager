package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.CustomerService;
import entity.Statistics;

@Controller
public class StatisticsController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value="statistics",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView statistics(){
		ModelAndView mv = new ModelAndView("statistics/statistics");
		List<Statistics> statis = customerService.searchStatis();
		mv.addObject("statis", statis);
		return mv;
	}
}
