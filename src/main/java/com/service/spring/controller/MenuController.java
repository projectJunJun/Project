package com.service.spring.controller;

import com.service.spring.model.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;


}
