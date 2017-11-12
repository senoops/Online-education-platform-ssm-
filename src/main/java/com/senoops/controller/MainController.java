package com.senoops.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.senoops.model.User;
import com.senoops.service.CourseService;
import com.senoops.service.SelectedcourseService;
import com.senoops.service.UserService;

import com.senoops.model.Course;
import com.senoops.model.Selectedcourse;
/**
 * @author luoxiao
 * @date 2017年1月14日
 */

@Controller
public class MainController {

	@Autowired
	private UserService userService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private SelectedcourseService selectedcourseService;
	/**
	 * 跳转首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView toIndex(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			List<Course> courses= courseService.selectAll();	
			
			System.out.println(courses);
		
			mv.setViewName("/courseindex");
			mv.addObject("courses", courses);			
		} catch (Exception e) {
			mv.setViewName("error/error");
			e.printStackTrace();
		}
				return mv;		
	}

	/**
	 * 注册
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public ModelAndView save(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			userService.save(user);
			Integer id = user.getId();
			System.out.println(id);
			/* UserRole userRole = userRoleService.selectByUserId(id); */
		
			
			 
			
			mv=toIndex(session);
		} catch (Exception e) {
			mv.setViewName("error/registError");
			e.printStackTrace();
		}
		session.setAttribute("loginUser", userService.selectById(user.getId()));
		
		return mv;
	}
	/**
	 * 跳转到detail页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/coursedetail", method = RequestMethod.GET)
	public String getdetail(int courseid, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Course course = courseService.selectByPrimaryKey(courseid);
		session.setAttribute("course", course);
		if(session.getAttribute("loginUser")==null)
			session.setAttribute("isSelect", false);
		else 
		{
			
			User user = (User) request.getSession().getAttribute("loginUser");
			Selectedcourse s = new Selectedcourse();
			s.setCourseid(courseid);s.setUserid(user.getId());
			boolean res=selectedcourseService.selectedcourseIsExist(s);
			if(res)
				session.setAttribute("isSelect", true);
			else
				session.setAttribute("isSelect", false);
		}
		return "coursedetail";
	}

	/**
	 * deleteCourse  
	 * 
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteCourse", method = RequestMethod.POST)
	public String deleteCourse(Selectedcourse user, HttpServletRequest request,
			HttpServletResponse response) {

		
		
		boolean b=selectedcourseService.delete(user);
		String result = b ? "true" : "false";
				
		
		
	return result;
	}
	/**
	 *   insertCourse
	 * 
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/insertCourse", method = RequestMethod.POST)
	public String insertCourse(Selectedcourse user, HttpServletRequest request,
			HttpServletResponse response) {

		
		
		int b=selectedcourseService.save(user);
		String result = b>0 ? "true" : "false";
				
		
		
	return result;
	}
	/**
	 * 跳转到coursevideo页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/course/video", method = RequestMethod.GET)
	public String playvideo(String courseid, HttpSession session, 
			Model model) {
		
		session.setAttribute("courseid", courseid);
		return "coursevideo";
	}
	/**
	 * 跳转到注册页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registPage(Model model) {
		return "regist";
	}
	
	/**
	 * 后台首页
	 * @return
	 */
	

	/**
	 * 跳转到登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/loginer", method = RequestMethod.GET)
	public String loginPage(Model model) {
		return "login";
	}
	/**
	 * 登录功能
	 * 
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(User user, HttpSession session, Model model) {
		
		
		User loginUser = userService.selectByUsername(user.getUsername());
		session.setAttribute("loginUser", loginUser);
		// System.out.println(loginUser);
		 return toIndex( session) ;
	}
	/**
	 * mycourse
	 * 
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/mylearn", method = RequestMethod.GET)
	public ModelAndView mylearn(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		try {
			
			User user = (User) request.getSession().getAttribute("loginUser");
			
			List<Selectedcourse> selectedcourses= selectedcourseService.selectcourseById(user.getId());
			List<Course> courses = new ArrayList<>();
			for (Selectedcourse c : selectedcourses) {
				courses.add(courseService.selectByPrimaryKey(c.getCourseid()));
			}
			
			
		
			mv.setViewName("/mylearn");
			mv.addObject("courses", courses);			
		} catch (Exception e) {
			mv.setViewName("error/error");
			e.printStackTrace();
		}
				return mv;		
	}

	/**
	 * 登出，清除session
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/user/logOut")
	public String logOut(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}

	/**
	 * ajax 检查用户名是否可用
	 * 
	 * @param username
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkUser", method = RequestMethod.GET)
	public String checkUser(String username, HttpServletRequest resqust,
			HttpServletResponse response) {
		Boolean b = userService.userIsExist(username);
		String result = b ? "true" : "false";
		return result;
	}

	/**
	 * ajax验证用户名密码
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/validatePassword")
	public String validateUser(String username) {
		User _user = userService.selectByUsername(username);
		String _password = _user.getPassword();
		if (_password == null) {
			return "";
		} else {
			return _password;
		}
	}

	

	




	
	

	
	

}
