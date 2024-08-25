package com.blog.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Blog {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int blogid;
	@Column(nullable = false)
	private int userid;
	@Column(nullable = false)
	private String title;
	@Column(nullable = false)
	private String topic;
	@Column(nullable = false,length = 1500)
	private String content;
	@Column(nullable = false,length = 1500)
	private String link;
	@Column(nullable = false)
	private String postedBy;
//	private Date postedDate;
	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Blog(int blogid, int userid, String title, String topic, String content, String link,String postedBy) {
		super();
		this.blogid = blogid;
		this.userid = userid;
		this.title = title;
		this.topic = topic;
		this.content = content;
		this.link = link;
		this.postedBy=postedBy;
	}
	public int getBlogid() {
		return blogid;
	}
	public void setBlogid(int blogid) {
		this.blogid = blogid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTopic() {
		return topic;
	}
	
	public String getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(String postedBy) {
		this.postedBy = postedBy;
	}

	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
