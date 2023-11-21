package com.service.spring.model;

import com.service.spring.domain.OrderList;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrderListDAO {
    List<OrderList> selectOrderByTable(OrderList orderList) throws Exception;
    List<OrderList> selectAllOrder(OrderList orderList);
    OrderList selectOrderDetail(OrderList orderList);
    List<OrderList> selectOrder(OrderList orderList);
    List<OrderList> selectOrderListByTable(String tableNumber);
}
