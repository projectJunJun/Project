package com.service.spring.controller;

import com.service.spring.domain.Account;
import com.service.spring.domain.OrderList;
import com.service.spring.model.AccountService;
import com.service.spring.model.OrderListDAO;
import com.service.spring.model.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Controller
public class OrderListController {
    @Autowired
    private OrderListService orderListService;

    @GetMapping("/pay.do")
    public String pay(String total, String people, Model model){
        model.addAttribute("total", total);
        model.addAttribute("people", people);
        return "PayResult";
    }

    @PostMapping("/pay.do")
    public String pay(OrderList order, HttpSession session, Model model) throws Exception {
        int teamId = (int) session.getAttribute("teamId");
        session.setAttribute("teamId", teamId+1);
        List<OrderList> list = orderListService.selectOrderByTable(order);
        model.addAttribute("list", list);
        return "Star";
    }
    // 전체 목록 조회
    @GetMapping("/selectAllOrder.do")
    public String selectAllOrder(OrderList orderList, Model model){
        String path = "Error";
        try{
            List<OrderList> orderLists = orderListService.selectAllOrder(orderList);
            model.addAttribute("orderLists", orderLists);
            path = "AdminOrderList";
        } catch (Exception e){
            model.addAttribute("title", "주문 내역 조회 - 에러");
            model.addAttribute("message", "문제 내용 - 전체 주문 목록 불러오기 중 에러발생");
        }
        return path;
    }
    // 테이블별 조회
    @GetMapping("/selectOrder.do")
    public String selectOrder(Account account, Model model){
        String path = "Error";
        try{
//            List<OrderList> orderList = orderListService.selectOrderListByTable();
            path = "AdminOrderListByTable";
        } catch (Exception e){
            model.addAttribute("title", "테이블별 주문 내역 조회 - 에러");
            model.addAttribute("message", "문제 내용 - 테이블별 주문 목록 불러오기 중 에러발생");
        }
        return path;
    }
    // 주문 목록 자세히 보기
    @GetMapping("/orderListDetail.do")
    public String doDetail(OrderList orderList, Model model){
        try{
            System.out.println("MOVE TO ORDER LIST DETAIL");
            System.out.println("before:"+orderListService.selectOrderDetail(orderList));
            OrderList orderInfo = orderListService.selectOrderDetail(orderList);
            System.out.println("orderInfo"+orderInfo);
            model.addAttribute("orderList", orderInfo);
            return "AdminOrderDetail";
        } catch (Exception e) {
            model.addAttribute("title", "주문 내역 상세 조회 - 에러");
            model.addAttribute("message", "문제 내용 - 주문 내역 상세 조회 중 에러발생");
            return "Error";
        }
    }
}
