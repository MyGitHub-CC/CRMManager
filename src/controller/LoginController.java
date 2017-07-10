package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.UserService;

import entity.RandomNumber;
import entity.User;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="login", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login() {
		return new ModelAndView("login/login");
	}
	
	@RequestMapping(value="randomImage", method={RequestMethod.POST, RequestMethod.GET})
	public void randomImage(HttpServletRequest request, HttpServletResponse response) {
		RandomNumber randomNumber = new RandomNumber();
		try {
			String sRand= randomNumber.generateImage(response);
			request.getSession().setAttribute("sRand",sRand);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="doLogin", method={RequestMethod.POST,RequestMethod.GET})
	public void doLogin(User user,String iRand,HttpServletRequest request,
			HttpServletResponse response) {
		String sRand = (String) request.getSession().getAttribute("sRand");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (iRand != null && sRand.equals(iRand) && user.getSalesman() != null) {
			User user2  = userService.searchByCondition(user);
			if (user2 != null) {
				request.getSession().setAttribute("user", user2);
				out.print("success");
			}else {
				out.print("用户名或密码错误！");
			}
		} else {
			out.print("登录失败！");
		}
	}
	

	
}
