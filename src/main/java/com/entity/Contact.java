package com.entity;

public class Contact {
	
	private int id;
	private String name;
	private String email;
	private String phonNo;
	private String about;
	private int userId;
	
	
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Contact( String name, String email, String phonNo, String about, int userId) {
		super();
		
		this.name = name;
		this.email = email;
		this.phonNo = phonNo;
		this.about = about;
		this.userId = userId;
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

	public String getPhonNo() {
		return phonNo;
	}

	public void setPhonNo(String phonNo) {
		this.phonNo = phonNo;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	
	
	

}
