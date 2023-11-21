package com.service.spring.controller;

import com.service.spring.domain.Account;
import com.service.spring.domain.OrderList;
import com.service.spring.model.AccountService;
import com.service.spring.domain.Menu;
import com.service.spring.model.MenuService;
import com.service.spring.model.OrderListDAO;
import com.service.spring.model.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.sql.Timestamp;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class OrderListController {
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
//        System.out.println("t	eamId"+teamId);
        System.out.println(orderListService.selectOrderByTable(account));
        List<OrderList> list = orderListService.selectOrderByTable(account);
        System.out.println("list"+list);
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
            path = "redirect:selectMenuByCategory.do";
            session.setAttribute("teamId", teamId+1);
        }catch (Exception e){
            model.addAttribute("title", "결제 및 별점 에러");
            model.addAttribute("message", "에러 내용 - 결제 및 별점 진행중 에러발생");
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
    			OrderList orderList = new OrderList(account.getUserId(), ids[i],  Integer.toString(teamId)
    					,new Timestamp(System.currentTimeMillis()), Integer.parseInt(counts[i].trim()));    			
    			int result = orderListService.updateOrderCount(orderList);
    			if (result==0) {
    				result = orderListService.addOrder(orderList);
    			}
    		}
    		path = "redirect:selectMenuByCategory.do";
    	}catch(Exception e) {
    		model.addAttribute("title", "주문 하기 - 에러");
            model.addAttribute("message", "문제 내용 - 주문 하기 실행 중 에러발생");
    	}
    	return path;
    	
  }
}