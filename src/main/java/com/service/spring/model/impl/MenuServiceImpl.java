package com.service.spring.model.impl;

import com.service.spring.domain.Menu;
import com.service.spring.model.MenuDAO;
import com.service.spring.model.MenuService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDAO menuDAO;

    @Override
    public int addMenu(Menu menu) {
      return menuDAO.addMenu(menu);
    }

    @Override
    public int updateMenu(Menu menu) {
      return menuDAO.updateMenu(menu);
    }

    @Override
    public int deleteMenu(List<Menu> list) {
      return menuDAO.deleteMenu(list);
    }

    @Override
    public Menu selectMenu(Menu menu) {
      return menuDAO.selectMenu(menu);
    }

    @Override
    public List<Menu> selectMenu() {
      return menuDAO.selectMenu();
    }

    @Override
    public List<Menu> selectMenuByCategory(String category) {
      return menuDAO.selectMenuByCategory(category);
    }
}
