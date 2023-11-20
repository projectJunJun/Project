package com.service.spring.model;

import com.service.spring.domain.OrderList;

import java.util.List;

public interface OrderListService {
    List<OrderList> selectOrderByTable(OrderList orderList) throws Exception;
}
