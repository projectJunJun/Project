package com.service.spring.model;

public interface OrderListDAO {

import com.service.spring.domain.OrderList;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrderListDAO {
    List<OrderList> selectOrderByTable(OrderList orderList) throws Exception;
}
