package com.service.spring.model;

import java.util.List;

import com.service.spring.domain.Account;
import com.service.spring.domain.OrderList;
import com.service.spring.domain.Table;

public interface OrderListService {
    List<OrderList> selectOrderByTable(Account account);
    int updateOrder(OrderList orderList);
    int updateOrderCount(OrderList orderList);
    int addOrder(OrderList orderList);
    List<OrderList> selectAllOrder(OrderList orderList);
    OrderList selectOrderDetail(OrderList orderList);
    List<OrderList> selectOrder(OrderList orderList);
    List<OrderList> selectOrderListByTable(String tableNumber);
    List<Table> viewTotalOrder();
    List<OrderList> viewOrderDetail(String tableNumber);
}
