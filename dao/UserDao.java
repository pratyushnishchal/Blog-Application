package com.blog.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.blog.model.User;

public class UserDao {
	static Configuration con = new Configuration().configure();
	static SessionFactory sf = con.buildSessionFactory();
	static Session s = null;

	public static boolean signup(User u) {
		try {
			s=sf.openSession();
			Transaction t=s.beginTransaction();
			if(s.save(u)!=null) {
				t.commit();
				return true;			
			}			
		}
		finally {
			s.close();
		}
		return false;
		
	}
	public static User loginUser(String email, String pass){
		try {
			s=sf.openSession();
			Query<User> q=s.createQuery("From User where email=:e and userPassword=:p");
			q.setParameter("e", email);
			q.setParameter("p", pass);
			return q.uniqueResult();
		}
		finally {
			s.close();
		}
	}
	public static void updateProfile(User u) {
		try {
			s=sf.openSession();
			Transaction t=s.beginTransaction();
			s.update(u);
			t.commit();
		}
		finally {
			s.close();
		}
	}
	public static User getUser(int id) {
		User u=null;
		s=sf.openSession();
		u=s.get(User.class, id);
		s.close();
		return u;
		
	}
}
