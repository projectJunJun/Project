package com.service.spring.model;

import com.service.spring.domain.Account;
import com.service.spring.domain.OrderList;
import com.service.spring.domain.Table;

import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrderListDAO {
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
