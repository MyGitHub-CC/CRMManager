package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.CarService;
import service.SalesmanService;
import service.StatusService;
import service.TalkRecordService;
import service.WayService;
import entity.Car;
import entity.Customer;
import entity.Salesman;
import entity.Status;
import entity.TalkRecord;
import entity.Way;

@Controller
public class TalkRecordController {
	@Autowired
	TalkRecordService trService;
	@Autowired
	CarService carService;
	@Autowired
	StatusService statusService;
	@Autowired
	SalesmanService salesmanService;
	@Autowired
	WayService wayService;
	
	@RequestMapping(value="customerTalk", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView customerTalk(Integer ye,TalkRecord conditonTalk) {
		ModelAndView mv = new ModelAndView("customer/customerTalk");
		if (conditonTalk.getCustomer() == null) {
			Customer customer = new Customer();
			conditonTalk.setCustomer(customer);
		}
		
		int count = trService.searchCount(conditonTalk);
		int maxPage =  (count - 1) / 2 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		}
		if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1) * 2;
		List<TalkRecord> talkRecords =  trService.search(begin,conditonTalk);
		mv.addObject("talkRecords", talkRecords);
		mv.addObject("conditonTalk", conditonTalk);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		
		List<Car> carList = carService.searchAll();
		List<Status> status2List = statusService.searchAll();
		List<Salesman> salesmanList = salesmanService.searchAll();
		List<Way> wayList = wayService.searchAll();

		mv.addObject("carList", carList);
		mv.addObject("status2List", status2List);
		mv.addObject("salesmanList", salesmanList);
		mv.addObject("wayList", wayList);
		return mv;
	}

	@RequestMapping(value="showModifyTalkRecord", method={RequestMethod.POST,RequestMethod.GET})
	public void showModifyTalkRecord(int tId, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		TalkRecord talkRecord = trService.searchById(tId);
		if (talkRecord != null) {
			try {
				PrintWriter out = response.getWriter();
				JSONArray jsonArray = JSONArray.fromObject(talkRecord);
				out.print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value="modifyTalkRecord", method={RequestMethod.POST,RequestMethod.GET})
	public void modifyTalkRecord(TalkRecord talkRecord, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		int result = trService.modify(talkRecord);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("保存成功");
			}else {
				out.print("保存失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="addTalkRecord", method={RequestMethod.POST,RequestMethod.GET})
	public void addTalkRecord(TalkRecord talkRecord, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		int result = trService.add(talkRecord);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("保存成功");
			}else {
				out.print("保存失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="deleteTalkRecord", method={RequestMethod.POST,RequestMethod.GET})
	public void deleteTalkRecord(int tId,HttpServletResponse response) {
		int result = trService.delete(tId);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("删除成功");
			}else {
				out.print("删除失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
