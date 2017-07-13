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

import service.RankService;
import service.SalesmanService;
import service.UserService;
import entity.Rank;
import entity.Salesman;
import entity.User;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	RankService rankService;
	@Autowired
	SalesmanService salesmanService;

	@RequestMapping(value = "user", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView user(Integer ye, User conditonUser) {
		ModelAndView mv = new ModelAndView("user/user");
		if (conditonUser.getSalesman() == null) {
			Salesman salesman = new Salesman();
			conditonUser.setSalesman(salesman);
		}
		int count = userService.searchCount();
		int maxPage = (count - 1) / 5 + 1;
		if (ye == null || ye < 1) {
			ye = 1;
		}
		if (ye > maxPage) {
			ye = maxPage;
		}
		int begin = (ye - 1) * 5;
		List<User> users = userService.search(begin, conditonUser);
		List<Rank> rankList = rankService.searchAll();
		List<Salesman> salesmanList = salesmanService.searchAll();
		mv.addObject("users", users);
		mv.addObject("conditonUser", conditonUser);
		mv.addObject("maxPage", maxPage);
		mv.addObject("ye", ye);
		mv.addObject("rankList", rankList);
		mv.addObject("salesmanList", salesmanList);
		return mv;
	}

	@RequestMapping(value = "addUser", method = { RequestMethod.POST, RequestMethod.GET })
	public void addUser(User user, HttpServletResponse response) {
		int result = userService.add(user);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("保存成功");
			} else {
				out.print("保存失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "showModifyUser", method = { RequestMethod.POST, RequestMethod.GET })
	public void showModifyUser(int uId, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		User user = userService.searchById(uId);
		if (user != null) {
			try {
				PrintWriter out = response.getWriter();
				JSONArray jsonArray = JSONArray.fromObject(user);
				out.print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "modifyUser", method = { RequestMethod.POST,
			RequestMethod.GET })
	public void modifyUser(User user, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		int result = userService.modify(user);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("保存成功");
			} else {
				out.print("保存失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "deleteUser", method = { RequestMethod.POST, RequestMethod.GET })
	public void deleteUser(int uId, HttpServletResponse response) {
		int result = userService.delete(uId);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.print("删除成功");
			} else {
				out.print("删除失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
