package com.service.spring.model;

import com.service.spring.domain.Account;
import com.service.spring.domain.OrderList;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrderListDAO {
    List<OrderList> selectOrderByTable(Account account);
    int updateOrder(OrderList orderList);
}
