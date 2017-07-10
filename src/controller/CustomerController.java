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
import service.CustomerDeleteService;
import service.CustomerService;
import service.SalesmanService;
import service.StatusService;
import entity.Car;
import entity.Customer;
import entity.Salesman;
import entity.Status;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	@Autowired
	CustomerDeleteService cdService;
	@Autowired
	CarService carService;
	@Autowired
	StatusService statusService;
	@Autowired
	SalesmanService salesmanService;
	
	@RequestMapping(value="customer", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView customer(Integer ye,Customer conditonCustomer) {
		ModelAndView mv = new ModelAndView("customer/customer");
		int count = customerService.searchCount(conditonCustomer);
		int maxPage =  (count - 1) / 2 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		}
		if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1) * 2;
		List<Customer> customers =  customerService.search(begin,conditonCustomer);
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
		Customer customer = customerService.searchById(cId);
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
		Customer customer = customerService.searchById(cId);
		int addResult = cdService.add(customer);
		int result = 0;
		if (addResult > 0) {
			result = customerService.delete(cId);
		}
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
