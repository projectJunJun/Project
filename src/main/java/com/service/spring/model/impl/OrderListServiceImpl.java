package com.service.spring.model.impl;

import com.service.spring.model.OrderListDAO;
import com.service.spring.model.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderListServiceImpl implements OrderListService {
    @Autowired
    private OrderListDAO orderListDAO;


}
