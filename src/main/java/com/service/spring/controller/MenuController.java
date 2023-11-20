package com.service.spring.controller;

import com.service.spring.domain.Menu;
import com.service.spring.model.MenuService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.service.spring.domain.Menu;
import com.service.spring.model.MenuService;

@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;

    @GetMapping("selectAllMenu.do")
    public String doSelectAllMenu (Model model) {
    	try {
    		List<Menu> menuList = menuService.selectMenu();
    		model.addAttribute("menuList",menuList);
    		return "AdminMenu";
    	} catch (Exception e) {
    		model.addAttribute("title", "메뉴전체보기 에러");
            model.addAttribute("message", "에러 내용 - 메뉴전체보기 중 에러발생");
    		return "Error";
    	}
    }
    
    @GetMapping("selectMenu.do")
    public String doSelectMenu (Menu menu, Model model) {
    	try {
    		Menu selMenu = menuService.selectMenu(menu);
    		model.addAttribute("menu",selMenu);
    		return "Menu";
    	} catch (Exception e) {
    		model.addAttribute("title", "메뉴상세보기 에러");
            model.addAttribute("message", "에러 내용 - 메뉴상세보기 중 에러발생");
    		return "Error";
    	}
    }
    
    @GetMapping("addMenu.do")
    public String getAddMenu(Model model) {
    	try {
    		return "addMenu";
    	} catch (Exception e) {
    		model.addAttribute("title", "메뉴추가하기 진입 에러");
            model.addAttribute("message", "에러 내용 - 메뉴추가하기 위한 진입 중 에러발생");
    		return "Error";
    	}
    }
    
    @PostMapping("addMenu.do")
    public String postAddMenu(Menu menu, Model model) {
    	//try {
    		System.out.println(menu.toString());
    		menuService.addMenu(menu);
    		return "redirect:selectAllMenu.do";
    	//} catch (Exception e) {
    	//	model.addAttribute("title", "메뉴추가하기 에러");
         //   model.addAttribute("message", "에러 내용 - 메뉴추가하기 중 에러발생");
    	//	return "Error";
    	//}

    @GetMapping("selectMenuByCategory.do")
    public String selectMenuByCategory(Model model) {
    	try {
    		System.out.println("메뉴 카테고리 진입 성공");
    		List<Menu>chickenlist =menuService.selectMenuByCategory("치킨");
    		List<Menu>sidelist =menuService.selectMenuByCategory("사이드");
    		List<Menu>beveragelist =menuService.selectMenuByCategory("음료");
    		model.addAttribute("chickenlist", chickenlist);
			model.addAttribute("sidelist", sidelist);
			model.addAttribute("beveragelist", beveragelist);
    		return "HomeUser";
    				
    	}catch(Exception e) {
    		model.addAttribute("title","카테고리 별 메뉴 불러오기 - 에러");
			model.addAttribute("message","문제 내용 - 카테고리 별 메뉴 불러오는 중 에러발생");
			return "Error";
    	}
    }
}
