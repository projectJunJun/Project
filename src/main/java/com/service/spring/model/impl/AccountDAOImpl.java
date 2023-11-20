package com.service.spring.model.impl;

import com.service.spring.domain.Account;
import com.service.spring.model.AccountDAO;

import java.util.List;

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

	@Override
	public int registerAccount(Account account) {
		return sqlSession.insert(NS+"registerAccount", account);
	}

	@Override
	public int updateAccount(Account account) {
		return sqlSession.update(NS+"updateAccount", account);
	}

	@Override
	public int deleteAccount(List<Account> account) {
		return sqlSession.delete(NS+"deleteAccount", account);
	}

	@Override
	public Account selectAccount(Account account) {
		return sqlSession.selectOne(NS+"selectAccount", account);
	}

	@Override
	public List<Account> selectAccount() {
		return sqlSession.selectList(NS+"selectAccount",null);
	}
}
