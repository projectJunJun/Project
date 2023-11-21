package com.service.spring.domain;

public class Table {
	private int tableNumber;
	private int totalPrice;
	private int countMenu;
	
	public Table() {}
	
	public Table(int tableNumber, int totalPrice, int countMenu) {
		this.tableNumber = tableNumber;
		this.totalPrice = totalPrice;
		this.countMenu = countMenu;
	}

	@Override
	public String toString() {
		return "Table [tableNumber=" + tableNumber + ", totalPrice=" + totalPrice + ", countMenu=" + countMenu + "]";
	}
	public int getTableNumber() {
		return tableNumber;
	}
	public void setTableNumber(int tableNumber) {
		this.tableNumber = tableNumber;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getCountMenu() {
		return countMenu;
	}
	public void setCountMenu(int countMenu) {
		this.countMenu = countMenu;
	}
	
}
