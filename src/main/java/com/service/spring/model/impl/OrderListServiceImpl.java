package com.service.spring.model.impl;

import com.service.spring.domain.OrderList;
import com.service.spring.model.OrderListDAO;
import com.service.spring.model.OrderListService;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderListServiceImpl implements OrderListService {
    @Autowired
    private OrderListDAO orderListDAO;

    @Override
    public List<OrderList> selectOrderByTable(OrderList orderList) throws Exception {
        return orderListDAO.selectOrderByTable(orderList);
    }

    @Override
    public List<OrderList> selectAllOrder(OrderList orderList) {
        return orderListDAO.selectAllOrder(orderList);
    }

    @Override
    public OrderList selectOrderDetail(OrderList orderList){
        return orderListDAO.selectOrderDetail(orderList);
    }

    @Override
    public List<OrderList> selectOrder(OrderList orderList){
        return orderListDAO.selectOrder(orderList);
    }

    @Override
    public List<OrderList> selectOrderListByTable(String tableNumber) {
        return orderListDAO.selectOrderListByTable(tableNumber);
    }


}
