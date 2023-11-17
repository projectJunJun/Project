package com.service.spring.model.impl;

import com.service.spring.domain.Account;
import com.service.spring.model.AccountDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOImpl implements AccountDAO {
    // mapper
    public static final String NS = "mapper.";

    @Autowired
    private SqlSession sqlSession;

    @Override
    public Account login(Account account) {
        return sqlSession.selectOne(NS+"login", account);
    }
}
