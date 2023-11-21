package com.service.spring.controller;

import com.service.spring.domain.Account;
import com.service.spring.domain.OrderList;
import com.service.spring.model.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

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
    
    
    @GetMapping("updateOrderList.do")
    public String updateOrderList(Model model, HttpSession session, String idList, String countList) {
        String path = "Error";
    	try {
    		System.out.println("주문하기 진입 성공");
    		Integer teamId = (Integer)session.getAttribute("teamId");
    		Account account = (Account) session.getAttribute("account");
    		String [] ids = idList.split(","); 
    		String [] counts = countList.split(",");
    		for (int i=0;i<ids.length;i++) {
    			System.out.println(ids[i]+","+counts[i]);
    			System.out.println(account.getUserId());
    			System.out.println(Integer.toString(teamId));
    			System.out.println(new Timestamp(System.currentTimeMillis()));
    			System.out.println(Integer.parseInt(counts[i].trim()));
    			OrderList orderList = new OrderList(account.getUserId(), ids[i],  Integer.toString(teamId)
    					,new Timestamp(System.currentTimeMillis()), Integer.parseInt(counts[i].trim()));
    			
    			System.out.println("==========="+orderList);	
    			int result = orderListService.updateOrderCount(orderList);
        		System.out.println("결과1"+result);
    			if (result==0) {
    				System.out.println("-------");
    				int result2 = orderListService.addOrder(orderList);
            		System.out.println("결과2"+result2);
    			}
    		}
    		path = "HomeUser";
    	}catch(Exception e) {
    		model.addAttribute("title", "주문 하기 - 에러");
            model.addAttribute("message", "문제 내용 - 주문 하기 실행 중 에러발생");
    	}
    	return path;
    	
}
    }