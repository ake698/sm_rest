package com.sm_rest.bean;

public class Userinfo {
	int userid;
	String username;
	String password;
	String phone;
	

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Userinfo [userid=" + userid + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ "]";
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Userinfo(int userid, String username, String password, String phone) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.phone = phone;
	}

	public Userinfo() {
		super();
	}
	
}
