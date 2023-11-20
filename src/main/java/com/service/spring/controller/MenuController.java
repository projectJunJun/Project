package com.service.spring.controller;

import com.service.spring.domain.Menu;
import com.service.spring.model.MenuService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;
    
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
