package com.service.spring.controller;

import com.service.spring.domain.OrderList;
import com.service.spring.model.OrderListDAO;
import com.service.spring.model.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OrderListController {

    @Autowired
    private OrderListDAO orderListDAO;

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
}
