package com.service.spring.model.impl;

import com.service.spring.model.MenuDAO;
import com.service.spring.model.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDAO menuDAO;

}
