package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.CarService;
import service.CustomerDeleteService;
import service.CustomerService;
import service.SalesmanService;
import service.StatusService;
import entity.Car;
import entity.Customer;
import entity.Salesman;
import entity.Status;

@Controller
public class CustomerDeleteController {

	@Autowired
	CustomerDeleteService cdService;
	@Autowired
	CustomerService customerService;
	@Autowired
	CarService carService;
	@Autowired
	StatusService statusService;
	@Autowired
	SalesmanService salesmanService;
	
	@RequestMapping(value="customerDelete", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView customerDelete(Integer ye,Customer conditonCustomer) {
		ModelAndView mv = new ModelAndView("customer/customerDelete");
		int count = customerService.searchCount(conditonCustomer);
		int maxPage =  (count - 1) / 2 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		}
		if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1) * 2;
		List<Customer> customers =  cdService.search(begin,conditonCustomer);
		List<Car> carList = carService.searchAll();
		List<Status> status2List = statusService.searchAll();
		List<Salesman> salesmanList = salesmanService.searchAll();
		mv.addObject("customers", customers);
		mv.addObject("conditonCustomer", conditonCustomer);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		mv.addObject("carList", carList);
		mv.addObject("status2List", status2List);
		mv.addObject("salesmanList", salesmanList);
		return mv;
	}
	
	@RequestMapping(value="deletecustomerDelete", method={RequestMethod.POST,RequestMethod.GET})
	public void deletecustomerDelete(int cId,HttpServletResponse response) {
		int result =  cdService.delete(cId);
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
	
	@RequestMapping(value="restorecustomerDelete", method={RequestMethod.POST,RequestMethod.GET})
	public void restorecustomerDelete(int cId,HttpServletResponse response) {
		Customer customer = cdService.searchById(cId);
		int addResult = customerService.add(customer);
		int result = 0;
		if (addResult > 0) {
			result = cdService.delete(cId);
		}
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("还原成功");
			}else {
				out.print("还原失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
