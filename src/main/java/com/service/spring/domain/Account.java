package com.service.spring.domain;

public class Account {
	private String userId;
	private String password;
	private int tableNumber;
	private int authority;
	
	public Account() {}
	
	public Account(String userId) {
		this.userId = userId;
	}
	
	public Account(String userId, String password, int authority) {
		this.userId = userId;
		this.password = password;
		this.authority = authority;
	}
		
	public Account(String userId, String password, int tableNumber, int authority) {
		this.userId = userId;
		this.password = password;
		this.tableNumber = tableNumber;
		this.authority = authority;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getTableNumber() {
		return tableNumber;
	}
	public void setTableNumber(int tableNumber) {
		this.tableNumber = tableNumber;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Account [userId=" + userId + ", password=" + password + ", tableNumber=" + tableNumber + ", authority="
				+ authority + "]";
	}
}
