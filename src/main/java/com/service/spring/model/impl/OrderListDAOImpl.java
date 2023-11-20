package com.service.spring.model.impl;

import com.service.spring.domain.Account;
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
    public List<OrderList> selectOrderByTable(Account account) {
        return sqlSession.selectList(NS+"selectOrderByTable", account);
    }

    @Override
    public int updateOrder(OrderList orderList) {
        return sqlSession.update(NS+"updateOrder", orderList);
        
    @Override
    public List<OrderList> selectOrder(String menuId) {
        return sqlSession.selectList(NS + "selectOrder", menuId);
    }
}
