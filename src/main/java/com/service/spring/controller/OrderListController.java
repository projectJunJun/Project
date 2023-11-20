package com.service.spring.controller;

import com.service.spring.domain.Account;
import com.service.spring.domain.Menu;
import com.service.spring.domain.OrderList;
import com.service.spring.model.MenuService;
import com.service.spring.model.OrderListDAO;
import com.service.spring.model.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;
import java.util.Map;

@Controller
public class OrderListController {

    @Autowired
    private OrderListDAO orderListDAO;

    @Autowired
    private OrderListService orderListService;

    @Autowired
    private MenuService menuService;

    // Pay.jsp -> PayResult.jsp
    @GetMapping("/pay.do")
    public String pay(String total, String people, Model model){
        int totals = Integer.parseInt(total);
        int peoples = Integer.parseInt(people);
        int rest = totals;
        DecimalFormat formatter = new DecimalFormat("###,###");
        ArrayList<String> moneys = new ArrayList<>();
        for(int i = 0; i < peoples; i++){
            if(i == peoples-1){
                moneys.add(formatter.format(rest));
            }else{
                int money = totals / peoples;
                moneys.add(formatter.format(money));
                rest -= money;
            }
        }
        model.addAttribute("total", formatter.format(totals));
        model.addAttribute("people", people);
        model.addAttribute("moneys", moneys);
        return "PayResult";
    }

    // PayResult.jsp -> Star.jsp
    @PostMapping("/star.do")
    public String star(HttpSession session, Model model) throws Exception{
        Account account = (Account) session.getAttribute("account");
        System.out.println("account"+account);
//        int teamId = (int) session.getAttribute("teamId");
//        System.out.println("teamId"+teamId);
        System.out.println(orderListService.selectOrderByTable(account));
        List<OrderList> list = orderListService.selectOrderByTable(account);
        System.out.println("list"+list);
        model.addAttribute("list", list);
        return "Star";
    }

    // Star.jsp -> HomeUser.jsp
    @PostMapping("/pay.do")
    public String pay(@RequestParam Map<String, String> params, HttpSession session, Model model) throws Exception {
        String path = "Error";
        Account account = (Account) session.getAttribute("account");
        int teamId = (int) session.getAttribute("teamId");
        ArrayList<String> menuIds = new ArrayList<>();
        ArrayList<Double> ratings = new ArrayList<>();
        try{
            params.forEach((key, value)->{
                if(key.substring(0,6).equals("menuId")){
                    menuIds.add(value);
                }else{
                    ratings.add(Double.parseDouble(value));
                }
            });
            for(int i = 0; i < ratings.size(); i++){
                OrderList order = new OrderList(account.getUserId(), menuIds.get(i), Integer.toString(teamId), ratings.get(i));
                orderListService.updateOrder(order);
                menuService.updateMenuStar(order);
            }
            path = "HomeUser";
            session.setAttribute("teamId", teamId+1);
        }catch (Exception e){
            model.addAttribute("title", "결제 및 별점 에러");
            model.addAttribute("message", "에러 내용 - 결제 및 별점 진행중 에러발생");
        }
        return path;
    }

//    @GetMapping("/selectOrderByTable.do")
//    public String selectOrderByTable(Model model){
//        String path = "Error";
//        try{
//            List<OrderList> orderLists =
//        } catch (Exception e){
//            model.addAttribute("title", "테이블별 주문 내역 조회 - 에러");
//            model.addAttribute("message", "문제 내용 - 테이블별 주문 목록 불러오기 중 에러발생");
//        }
//    }

}
