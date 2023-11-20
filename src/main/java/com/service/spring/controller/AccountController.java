package com.service.spring.controller;

import com.service.spring.domain.Account;
import com.service.spring.model.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AccountController {
    @Autowired
    private AccountService accountService;

    @RequestMapping("/")
    public String index() {return "redirect:Login.jsp";}

    @PostMapping("/login.do")
    public String doLogin(Account account, HttpSession session, Model model){
        try {
            Account loginAccount = accountService.login(account);

            if(loginAccount != null){   // 찾는 회원이 있다면
                String path = "redirect:selectMenuByCategory.do";
                session.setAttribute("account", loginAccount);
                model.addAttribute("title", "핸드폰 관리 성공");
                if(loginAccount.getAuthority() == 1) path = "HomeAdmin";
                else session.setAttribute("teamId", 1);         // teamId
        		System.out.println(path+"path 반환 성공");

                return path;
            } else{
                return "Login";
            }

        } catch (Exception e){
            model.addAttribute("title", "로그인 에러");
            model.addAttribute("message", "에러 내용 - 회원 로그인 진행중 에러발생");
            return "Error";
        } // catch
    } // doLogin

    @GetMapping("/logout.do")
    public String doLogout(Account account, HttpSession session){
        if(session.getAttribute("account") != null){
            session.invalidate();
        }
        return "Login";
    }
}
