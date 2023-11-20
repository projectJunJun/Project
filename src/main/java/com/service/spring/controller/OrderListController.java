package com.service.spring.controller;

import com.service.spring.domain.OrderList;
import com.service.spring.model.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class OrderListController {
    @Autowired
    private OrderListService orderListService;

    @GetMapping("/selectAllOrder.do")
    public String selectOrder(String menuId, Model model){
        String path = "Error";
        try{
            List<OrderList> orderLists = orderListService.selectOrder(menuId);
            model.addAttribute("orderLists", orderLists);
            path = "AdminOrderList";
        } catch (Exception e){
            model.addAttribute("title", "주문 내역 조회 - 에러");
            model.addAttribute("message", "문제 내용 - 전체 주문 목록 불러오기 중 에러발생");
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
