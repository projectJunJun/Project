package com.service.spring.model.impl;

import com.service.spring.domain.Account;
import com.service.spring.model.AccountDAO;
import com.service.spring.model.AccountService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountDAO accountDAO;

    @Override
    public Account login(Account account) {
        return accountDAO.login(account);
    }

	@Override
	public int registerAccount(Account account) {
		return accountDAO.registerAccount(account);
	}

	@Override
	public int updateAccount(Account account) {
		return accountDAO.updateAccount(account);
	}

	@Override
	public int deleteAccount(List<String> list) {
		return accountDAO.deleteAccount(list);
	}

	@Override
	public Account selectAccount(Account account) {
		return accountDAO.selectAccount(account);
	}

	@Override
	public List<Account> selectAccount() {
		return accountDAO.selectAccount();
	}
}
