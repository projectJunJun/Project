package com.service.spring.domain;

public class Menu {
	private String menuId;
	private String name;
	private String category;
	private int price;
	private String url;
	private String description;
	private double totalStar;
	private int countStar;
	
	public Menu() {}
	
	public Menu(String menuId) {
		this.menuId = menuId;
	}
	
	public Menu(String menuId, String name, String category, int price, String url, String description) {
		super();
		this.menuId = menuId;
		this.name = name;
		this.category = category;
		this.price = price;
		this.url = url;
		this.description = description;
	}
	
	public Menu(String menuId, String name, String category, int price, String url, String description,
			double totalStar, int countStar) {
		super();
		this.menuId = menuId;
		this.name = name;
		this.category = category;
		this.price = price;
		this.url = url;
		this.description = description;
		this.totalStar = totalStar;
		this.countStar = countStar;
	}
	
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getTotalStar() {
		return totalStar;
	}
	public void setTotalStar(double totalStar) {
		this.totalStar = totalStar;
	}
	public int getCountStar() {
		return countStar;
	}
	public void setCountStar(int countStar) {
		this.countStar = countStar;
	}
	
	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", name=" + name + ", category=" + category + ", price=" + price + ", url="
				+ url + ", description=" + description + ", totalStar=" + totalStar + ", countStar=" + countStar + "]";
	}
}
