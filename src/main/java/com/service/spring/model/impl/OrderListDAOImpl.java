package com.service.spring.model.impl;

import com.service.spring.domain.OrderList;
import com.service.spring.model.OrderListDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderListDAOImpl implements OrderListDAO {
    // mapper
    public static final String NS = "mapper.";

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<OrderList> selectOrderByTable(OrderList orderList) throws Exception {
        return sqlSession.selectList(NS+"selectOrderByTable");
    }
    @Override
    public List<OrderList> selectAllOrder(OrderList orderList) {
        return sqlSession.selectList(NS + "selectAllOrder", orderList);
    }
    @Override
    public OrderList selectOrderDetail(OrderList orderList) {
        return sqlSession.selectOne(NS+"selectOrder", orderList);
    }

    @Override
    public List<OrderList> selectOrder(OrderList orderList){
        return sqlSession.selectList(NS+"selectOrder", orderList);
    }

    @Override
    public List<OrderList> selectOrderListByTable(String tableNumber) {
        return sqlSession.selectList(NS+"selectOrderListByTable", tableNumber);
    }
}
