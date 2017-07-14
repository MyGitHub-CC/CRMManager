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
import service.CustomerService;
import service.SalesmanService;
import service.StatusService;
import service.WayService;
import entity.Car;
import entity.Customer;
import entity.Salesman;
import entity.Status;
import entity.Way;

@Controller
public class CustomerController {
	@Autowired
	CustomerService customerService;
	@Autowired
	CarService carService;
	@Autowired
	StatusService statusService;
	@Autowired
	SalesmanService salesmanService;
	@Autowired
	WayService wayService;
	
	@RequestMapping(value="customer", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView customer(Integer ye,Customer conditonCustomer) {
		ModelAndView mv = new ModelAndView("customer/customer");
		int del = 0;
		int count = customerService.searchCount(conditonCustomer,del);
		int maxPage =  (count - 1) / 5 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		}
		if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1) * 5;
		List<Customer> customers =  customerService.search(begin,conditonCustomer,del);
		mv.addObject("customers", customers);
		mv.addObject("conditonCustomer", conditonCustomer);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		// 下拉列表集合
		List<Way> wayList = wayService.searchAll();
		List<Status> status2List = statusService.searchAll();
		List<Car> carList = carService.searchAll();
		List<Salesman> salesmanList = salesmanService.searchAll();
		mv.addObject("wayList", wayList);
		mv.addObject("status2List", status2List);
		mv.addObject("carList", carList);
		mv.addObject("salesmanList", salesmanList);
		return mv;
	}
	
	@RequestMapping(value="showAddCustomer", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView showAddCustomer() {
		ModelAndView mv = new ModelAndView("customer/addCustomer");
		// 下拉列表集合
		List<Way> wayList = wayService.searchAll();
		List<Status> status2List = statusService.searchAll();
		List<Car> carList = carService.searchAll();
		List<Salesman> salesmanList = salesmanService.searchAll();
		mv.addObject("wayList", wayList);
		mv.addObject("status2List", status2List);
		mv.addObject("carList", carList);
		mv.addObject("salesmanList", salesmanList);
		return mv;
	}
	
	@RequestMapping(value="addCustomer", method={RequestMethod.POST,RequestMethod.GET})
	public void addCustomer(Customer customer,HttpServletResponse response) {
		int result = customerService.add(customer);
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
	
	@RequestMapping(value="showModifyCustomer", method={RequestMethod.POST,RequestMethod.GET})
	public void showModifyCustomer(int cId, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		Customer customer = customerService.searchById(cId,0);
		if (customer != null) {
			try {
				PrintWriter out = response.getWriter();
				JSONArray jsonArray = JSONArray.fromObject(customer);
				out.print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value="modifyCustomer", method={RequestMethod.POST,RequestMethod.GET})
	public void modifyCustomer(Customer customer, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		int result = customerService.modify(customer);
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
	
	@RequestMapping(value="deleteCustomer", method={RequestMethod.POST,RequestMethod.GET})
	public void deleteCustomer(int cId,HttpServletResponse response) {
		int del = 1;
		int result = customerService.deleteUpdate(cId,del);
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
