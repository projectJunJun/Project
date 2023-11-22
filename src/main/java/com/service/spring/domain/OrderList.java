package com.service.spring.domain;

import java.sql.Timestamp;

public class OrderList {
	private String orderId;
	private String userId;
	private String menuId;
	private String teamId;
	private Timestamp orderTime;
	private int count;
	private double star;
	private int isPaid;
	private Account account;
	private Menu menu;
	
	public OrderList() {}
	
	// 결제, 별점 바꿀 때
	public OrderList(String userId, String menuId, String teamId, double star, int isPaid) {
		this.userId = userId;
		this.menuId = menuId;
		this.teamId = teamId;
		this.star = star;
		this.isPaid = isPaid;
	}
	
	// 주문할 때 db에 들어감
	public OrderList(String userId, String menuId, String teamId, Timestamp orderTime, int count) {
		this.userId = userId;
		this.menuId = menuId;
		this.teamId = teamId;
		this.orderTime = orderTime;
		this.count = count;
	}
	
	// join 안할 때 사용
	public OrderList(String orderId, String userId, String menuId, String teamId, Timestamp orderTime, int count,
			double star, int isPaid) {
		this.orderId = orderId;
		this.userId = userId;
		this.menuId = menuId;
		this.teamId = teamId;
		this.orderTime = orderTime;
		this.count = count;
		this.star = star;
		this.isPaid = isPaid;
	}
	
	// db에서 불러올 때 - 별점, 결제
	public OrderList(String userId, String menuId, String teamId, Timestamp orderTime, int count, Account account, Menu menu) {
		this.userId = userId;
		this.menuId = menuId;
		this.teamId = teamId;
		this.orderTime = orderTime;
		this.count = count;
		this.account = account;
		this.menu = menu;
	}
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}
	public Timestamp getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public int getIsPaid() {
		return isPaid;
	}
	public void setIsPaid(int isPaid) {
		this.isPaid = isPaid;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	@Override
	public String toString() {
		return "OrderList [orderId=" + orderId + ", userId=" + userId + ", menuId=" + menuId + ", teamId=" + teamId
				+ ", orderTime=" + orderTime + ", count=" + count + ", star=" + star + ", isPaid=" + isPaid
				+ ", account=" + account + ", menu=" + menu + "]";
	}
}
