package com.blog.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false)
	private String name;
	@Column(nullable = false, unique = true)
	private String email;
	@Column(nullable = false, unique = true)
	private long mobileNum;
	@Column(nullable = false)
	private String city;
	@Column(nullable = false)
	private String gender;
	@Column(nullable = false)
	private String userPassword;
	@Column(nullable = false)
	private String bio;
	@Column(nullable = false)
	private String country;
	@Column(nullable = false, unique = true)
	private String uid;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id, String name, String email, long mobileNum, String city,String gender, String userPassword,String bio, String country, String uid) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobileNum = mobileNum;
		this.city = city;
		this.userPassword = userPassword;
		this.gender = gender;
		this.bio = bio;
		this.country = country;
		this.uid = uid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getMobileNum() {
		return mobileNum;
	}
	public void setMobileNum(long mobileNum) {
		this.mobileNum = mobileNum;
	}
	public String getCity() {
		return city;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", mobileNum=" + mobileNum + ", city=" + city
				+ ", gender=" + gender + ", userPassword=" + userPassword + ", bio=" + bio + ", country=" + country
				+ ", uid=" + uid + "]";
	}
	
	
}
