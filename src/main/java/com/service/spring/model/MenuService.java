package com.service.spring.model;

import java.util.List;

import com.service.spring.domain.Menu;

public interface MenuService {
	int addMenu (Menu menu);
	int updateMenu (Menu menu);
	int deleteMenu (List<Menu> list);
	Menu selectMenu (Menu menu);
	List<Menu> selectMenu ();
	List<Menu> selectMenuByCategory(String category);
}
