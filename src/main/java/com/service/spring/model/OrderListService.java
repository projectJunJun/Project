package com.service.spring.model;

import com.service.spring.domain.Account;
import com.service.spring.domain.OrderList;

import java.util.List;

public interface OrderListService {
    List<OrderList> selectOrderByTable(Account account);
    int updateOrder(OrderList orderList);
    List<OrderList> selectOrder(String menuId);
    int updateOrderCount(OrderList orderList);
    int addOrder(OrderList orderList);
}
