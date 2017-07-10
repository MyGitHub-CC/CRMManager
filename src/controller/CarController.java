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
import entity.Car;

@Controller
public class CarController {

	@Autowired
	CarService carService;
	
	@RequestMapping(value="car", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView car(Integer ye) {
		ModelAndView mv = new ModelAndView("car/car");
		int count = carService.searchCount();
		int maxPage =  (count - 1) / 2 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		}
		if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1) * 2;
		List<Car> cars =  carService.search(begin);
		mv.addObject("cars", cars);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		return mv;
	}
	
	@RequestMapping(value="addCar", method={RequestMethod.POST,RequestMethod.GET})
	public void addCar(Car car,HttpServletResponse response) {
		int result = carService.add(car);
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
	
	@RequestMapping(value="showModifyCar", method={RequestMethod.POST,RequestMethod.GET})
	public void showModifyCar(int cId, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		Car car = carService.searchById(cId);
		if (car != null) {
			try {
				PrintWriter out = response.getWriter();
				JSONArray jsonArray = JSONArray.fromObject(car);
				out.print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value="modifyCar", method={RequestMethod.POST,RequestMethod.GET})
	public void modifyCar(Car car, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		int result = carService.modify(car);
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
	
	@RequestMapping(value="deleteCar", method={RequestMethod.POST,RequestMethod.GET})
	public void deleteCar(int cId,HttpServletResponse response) {
		int result = carService.delete(cId);
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
