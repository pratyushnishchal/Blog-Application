package com.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.dao.BlogDao;
import com.blog.dao.UserDao;
import com.blog.model.Blog;
import com.blog.model.User;

@Controller
public class UserController {
	@GetMapping("/")
	public String getWelcomePage() {
		return "welcome";
	}
	@GetMapping("/signup")
	public String signupUserPage() {
		return "signup";
	}
	@PostMapping("/signup")
	public String signupUser(@ModelAttribute("register") User u) {
		boolean status = UserDao.signup(u);
		if (status) {
			return "login";
		}
		return "/";
	}
	@GetMapping("/loginuser")
	public String loginUser() {
		return "login";
	}
	@PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, @RequestParam("userPassword") String userPassword, HttpSession session) {
		User user=UserDao.loginUser(email, userPassword);
		if(user!=null) {
			session.setAttribute("loginuser", user);
			return "redirect:/welcome";			
		}
		else {
			session.setAttribute("msg", "Invalid email or password");
			return "login";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session , HttpServletRequest request) {
		session.getAttribute("loginuser");
		session.removeAttribute("loginuser");
		session.setAttribute("msg", "logout successful");
		return "login";
	}
	@GetMapping("/viewprofile/{id}")
	public String viewUser(@PathVariable int id,HttpSession session) {
		if(session.getAttribute("loginuser")!=null) {
			return "viewprofile";			
		}
		return "login";
	}
	@GetMapping("/update-profile")
	public String updateProfile(HttpSession session) {
		if(session.getAttribute("loginuser")!=null) {
			return "update-profile";			
		}
		return "login";
	}
	@PostMapping("/update-profile")
	public String updateProfile(@ModelAttribute("update-user-profile") User u,HttpSession session) {
		User user=UserDao.getUser(u.getId());
		if(user!=null) {
			user.setEmail(u.getEmail());
			user.setCity(u.getCity());
			user.setGender(u.getGender());
			user.setMobileNum(u.getMobileNum());
			user.setName(u.getName());
			user.setUserPassword(u.getUserPassword());
			UserDao.updateProfile(u);
			session.setAttribute("loginuser", user);
			return "viewprofile";
		}
		return "login";
	}
	
}
