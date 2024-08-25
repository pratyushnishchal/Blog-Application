package com.blog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.dao.BlogDao;
import com.blog.model.Blog;
import com.blog.model.User;

@Controller
public class BlogController {
	@GetMapping("/add-blog")
	public String addBlog(HttpSession session) {
		if (session.getAttribute("loginuser") != null) {
			return "add-blog";
		}
		return "signup";
	}

	@PostMapping("/add-blog")
	public String addBlog(@ModelAttribute("addblog") Blog b) {
		Blog blog = BlogDao.addBlogContent(b);
		return "redirect:/welcome";

	}

	@GetMapping("/welcome")
	public String welcomePage(HttpSession session, Model model) {
		if (session.getAttribute("loginuser") != null) {
			List<Blog> blogs = BlogDao.getAllBlogs();
			model.addAttribute("blogs", blogs);
			return "welcome";
		}
		return "welcome";
	}

	@GetMapping("/userblogs/{id}")
	public String getBlogsById(@PathVariable int id, HttpSession session, Model m) {
		if (session.getAttribute("loginuser") != null) {
			List<Blog> bl = BlogDao.getBlogsByUserId(id);
			m.addAttribute("bloguser", bl);
			return "userblogs";
		}
		return "signup";
	}

	@GetMapping("/editblog/{blogid}")
	public String updateBlog(@PathVariable int blogid, HttpSession session) {
		if (session.getAttribute("loginuser") != null) {
			Blog blogs = BlogDao.getBlogByBlogId(blogid);
			session.setAttribute("bloguse", blogs);
			return "editblog";
		}
		return "signup";
	}

	@PostMapping("/editblog")
	public String updateBlog(@ModelAttribute("editblog") Blog blog, HttpSession session) {
		User user = (User) session.getAttribute("loginuser");
		if (user != null) {
			Blog existingBlog = BlogDao.getBlogByBlogId(blog.getBlogid());
			if (existingBlog != null) {
				existingBlog.setTitle(blog.getTitle());
				existingBlog.setContent(blog.getContent());
				existingBlog.setLink(blog.getLink());
				existingBlog.setTopic(blog.getTopic());
				BlogDao.updateBlog(existingBlog);
				return "redirect:/userblogs/" + user.getId(); // Redirect to the list of user blogs
			}
		}
		return "signup";
	}
	@GetMapping("/deleteblog/{blogid}")
	public String deleteBlog(@PathVariable int blogid,HttpSession session) {
		User user=(User) session.getAttribute("loginuser");
		if(user!=null) {
			BlogDao.deleteBlog(blogid);
			return "redirect:/userblogs/" + user.getId();
		}
		return "signup";
	}
	@GetMapping("/readmore/{blogid}")
	public String readMore(@PathVariable int blogid, Model m,HttpSession session) {
		if(session.getAttribute("loginuser")!=null) {
			Blog blog=BlogDao.getBlogByBlogId(blogid);
			m.addAttribute("blog",blog);
			return "showfullpost";
		}
		return "signup";
		
	}
	@PostMapping("/search")
	public String searchBlog(HttpSession session, @RequestParam("searchtext") String searchtext, Model m) {
		if(session.getAttribute("loginuser")!=null) {
			List<Blog> b=BlogDao.searchBlog(searchtext);
			m.addAttribute("search",b);
			return "search-blog";		
		}
		return "signup";
	}
	
}
