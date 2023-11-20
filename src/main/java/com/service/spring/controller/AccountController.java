package com.service.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.spring.domain.Account;
import com.service.spring.model.AccountService;

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
                // String path = "HomeUser";
                // "selectMenyByCategory";
                String path = "redirect:selectMenuByCategory.do";
                session.setAttribute("account", loginAccount);
                System.out.println("login session"+loginAccount);
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

    @PostMapping("/logout.do")
    public String doLogout(HttpSession session, String password, Model model){
        String path = "Error";
        Account account = (Account) session.getAttribute("account");
        System.out.println("account"+account);
        System.out.println("password"+password);
        if(account.getPassword().equals(password) & (account != null)){
            session.invalidate();
            path = "Login";
        } else{ // 비밀번호 틀림
            model.addAttribute("title", "로그아웃 에러");
            model.addAttribute("message", "에러 내용 - 회원 로그아웃 진행중 에러발생");
        }
        return path;
    }

    @GetMapping("/logoutAdmin.do")
    public String doLogoutAdmin(HttpSession session, Model model){
        String path = "Error";
        Account account = (Account) session.getAttribute("account");
        System.out.println("Admin account"+account);
        if(account!= null){
            session.invalidate();
            path = "Login";
        }
        else{
            model.addAttribute("title", "로그아웃 에러");
            model.addAttribute("message", "에러 내용 - 관리자 로그아웃 진행중 에러발생");
        }
        return path;
    }
    
    @GetMapping("/selectAllAccount.do")
    public String doSelectAllAccount(Model model) {
    	try {
    		List<Account> accountList= accountService.selectAccount();
    		model.addAttribute("accountList",accountList);
    		return "AdminAccount";
    	} catch (Exception e) {
    		model.addAttribute("title", "계정전체보기 에러");
            model.addAttribute("message", "에러 내용 - 메뉴전체보기 중 에러발생");
            return "Error";
    	}
    }
    
    @GetMapping("/selectAccount.do")
    public String doSelectAccount (Account account, Model model) {
    	try {
    		System.out.println(account.toString());
    		Account resAccount = accountService.selectAccount(account); // account 정보 받아와서  쿼리 실행 후 유저가 선택한 account 객체 생성
    		System.out.println(resAccount);
    		model.addAttribute("account",resAccount);
    		return "Account"; //계정 상세보기 페이지로 이동
    	} catch (Exception e) {
    		model.addAttribute("title", "계정상세보기 에러");
            model.addAttribute("message", "에러 내용 - 계정상세보기 중 에러발생");
    		 return "Error"; // 에러
    	}
    }
    
    @GetMapping("/registerAccount.do")
    public String getRegisterAccount (Model model) {
    	try {
    		return "registerAccount";
    	} catch (Exception e) {
    		model.addAttribute("title", "계정등록폼 에러");
            model.addAttribute("message", "에러 내용 - 계정등록 진입 중 에러발생");
    		return "Error"; // 에러
    	}
    	
    }
    
    @PostMapping("/registerAccount.do")
    public String postRegisterAccount (Account account, Model model) {
    	try {
    		accountService.registerAccount(account);
    		return "redirect:selectAllAccount.do";
    	} catch (Exception e) {
    		model.addAttribute("title", "계정등록 에러");
            model.addAttribute("message", "에러 내용 - 계정등록 진행 중 에러발생");
    		return "Error";
    	}
    }
    
 // 비동기 추가...deleteAjax
 	@PostMapping("deleteAjax.do")
 	@ResponseBody
 	public String doDeleteAjax(@RequestParam List<String> list, Model model) {
 		try {
 			System.out.println(list);
 			accountService.deleteAccount(list);
 			return "";
 			
 		}catch(Exception e) {
 			model.addAttribute("title", "핸드폰 관리 - 에러");
 			model.addAttribute("message", "문제 내용 - 폰 삭제 중 에러 발생");
 			return "Error";
 		}
 	}
}
