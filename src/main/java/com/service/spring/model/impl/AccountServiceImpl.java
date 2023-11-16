package com.service.spring.model.impl;

import com.service.spring.domain.Account;
import com.service.spring.model.AccountDAO;
import com.service.spring.model.AccountService;
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
}
