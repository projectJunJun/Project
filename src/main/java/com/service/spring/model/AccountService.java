package com.service.spring.model;

import java.util.List;

import com.service.spring.domain.Account;

public interface AccountService {
    // Login.jsp에서 login.do mapping시
    Account login(Account account);
    int registerAccount(Account account);
    int updateAccount(Account account);
    int deleteAccount(List<String> list);
    Account selectAccount(Account account);
    List<Account> selectAccount();
    
}
