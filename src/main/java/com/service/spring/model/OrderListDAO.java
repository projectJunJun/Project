package com.service.spring.model;

import com.service.spring.domain.OrderList;

import java.util.List;

public interface OrderListDAO {
    List<OrderList> selectOrder(String menuId);
}
