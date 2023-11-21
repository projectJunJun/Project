package com.service.spring.model.impl;

import com.service.spring.domain.Account;
import com.service.spring.domain.Menu;
import com.service.spring.domain.OrderList;
import com.service.spring.model.OrderListDAO;
import com.service.spring.model.OrderListService;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderListServiceImpl implements OrderListService {
    @Autowired
    private OrderListDAO orderListDAO;

    @Override
    public List<OrderList> selectOrderByTable(Account account) {
        return orderListDAO.selectOrderByTable(account);
    }

    @Override
    public int updateOrder(OrderList orderList) {
        return orderListDAO.updateOrder(orderList);
    }

    @Override
    public List<OrderList> selectOrder(String menuId) {
        return orderListDAO.selectOrder(menuId);
    }


	@Override
	public int updateOrderCount(OrderList orderList) {
		return orderListDAO.updateOrderCount(orderList);
	}

	@Override
	public int addOrder(OrderList orderList) {
		System.out.println("SERVICE"+orderList);
		return orderListDAO.addOrder(orderList);
	}

}
