package com.service.spring.model;

import com.service.spring.domain.Account;
import com.service.spring.domain.OrderList;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.util.List;

public interface OrderListService {
    List<OrderList> selectOrderByTable(Account account);
    int updateOrder(OrderList orderList);
    int updateOrderCount(OrderList orderList);
    int addOrder(OrderList orderList);
    List<OrderList> selectAllOrder(OrderList orderList);
    OrderList selectOrderDetail(OrderList orderList);
    List<OrderList> selectOrder(OrderList orderList);
    List<OrderList> selectOrderListByTable(String tableNumber);
}
