package com.blog.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.blog.model.Blog;

public class BlogDao {
	static Configuration con=new Configuration().configure();
	static SessionFactory sf=con.buildSessionFactory();
	static Session s=null;
	public static Blog addBlogContent(Blog b) {
		try {
			s=sf.openSession();
			Transaction t=s.beginTransaction();
			s.save(b);
			t.commit();
		}
		finally {
			s.close();
		}
		return b;
	}
	public static List<Blog> getAllBlogs() {
        List<Blog> blogs = new ArrayList<Blog>();
        try {
            s = sf.openSession();
            blogs = s.createQuery("FROM Blog", Blog.class).list();
        } finally {
            if (s != null) s.close();
        }
        return blogs;
    }
	public static List<Blog> getBlogsByUserId(int id) {
		List<Blog> blogs=null;
		try {
			s=sf.openSession();
			Query<Blog> q=s.createQuery("From Blog where userid=:uid");
			q.setParameter("uid", id);
			blogs=q.getResultList();
		}
		finally {
			s.close();
		}
		return blogs;
	}
	public static Blog getBlogByBlogId(int blogid) {
		Blog blog=null;
		try {
			s=sf.openSession();
			Query<Blog> q=s.createQuery("From Blog where blogid=:bid");
			q.setParameter("bid", blogid);
			blog=q.uniqueResult();
		}
		finally {
			s.close();
		}
		return blog;
	}
	public static void updateBlog(Blog blog) {
		try {
			s=sf.openSession();
			Transaction t=s.beginTransaction();
			s.update(blog);
			t.commit();
		}
		finally {
			s.close();
		}
	}
	public static void deleteBlog(int blogid) {
		try {
			s=sf.openSession();
			Transaction t=s.beginTransaction();
			Blog blog=s.get(Blog.class, blogid);
			if(blog!=null) {
				s.delete(blog);
				t.commit();
			}
		}
		finally {
			s.close();
		}
	}
	public static List<Blog> searchBlog(String searchtext){
		List<Blog> blog=null;
		try {
			s=sf.openSession();
	        Query<Blog> q = s.createQuery("FROM Blog WHERE title LIKE :searchText OR topic LIKE :searchText OR content LIKE :searchText OR postedBy LIKE :searchText");
	        q.setParameter("searchText", "%" + searchtext + "%");
			blog=q.list();
		}
		finally {
			s.close();
		}
		return blog;
	}
	
	
}
