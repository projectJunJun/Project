package com.service.spring.model;

import com.service.spring.domain.Account;

public interface AccountService {
    // Login.jsp에서 login.do mapping시
    Account login(Account account);
}
