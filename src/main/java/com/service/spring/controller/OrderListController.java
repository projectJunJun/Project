package com.service.spring.controller;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.spring.domain.Account;
import com.service.spring.domain.OrderList;
import com.service.spring.domain.Table;
import com.service.spring.model.AccountService;
import com.service.spring.model.MenuService;
import com.service.spring.model.OrderListService;

@Controller
public class OrderListController {
    @Autowired
    private OrderListService orderListService;

    @Autowired
    private MenuService menuService;
    
    @Autowired
    private AccountService accountService;

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
    public String pay(@RequestParam Map<String, String> params, HttpSession session, Model model) {
        System.out.println("Params"+params);
        String path = "Error";
        Account account = (Account) session.getAttribute("account");
        int teamId = (int) session.getAttribute("teamId");
        System.out.println("현재 teamId "+teamId);
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
            System.out.println("menuIds"+menuIds);
            System.out.println("ratings"+ratings);
            for(int i = 0; i < ratings.size(); i++){
                OrderList order = new OrderList(account.getUserId(), menuIds.get(i), Integer.toString(teamId), ratings.get(i));
                if(ratings.get(i) > 0){
                    menuService.updateMenuStar(order);
                    System.out.println("====메뉴 "+menuIds.get(i)+"결제 완료 후 별점 "+ratings.get(i)+"====");
                }
                orderListService.updateOrder(order);
                System.out.println("====메뉴 "+menuIds.get(i)+"결제 완료 후 별점 "+ratings.get(i)+"====");
            }
            path = "redirect:selectMenuByCategory.do";
            session.setAttribute("teamId", teamId+1);
            int newTeamId = (int) session.getAttribute("teamId");
            System.out.println("바뀐 teamId "+newTeamId);
        }catch (Exception e){
            model.addAttribute("title", "결제 및 별점 에러");
            model.addAttribute("message", "에러 내용 - 결제 및 별점 진행중 에러발생");
        }
        return path;
    }
            
    // 테이블별 조회
    @GetMapping("/selectOrder.do")
    public String selectOrder(Table table, Account account, Model model){
        String path = "Error";
        try{
        	List<Account> accountList = accountService.selectAccount();
        	model.addAttribute("accountList", accountList);
        	List<Table> tableList = orderListService.viewTotalOrder();
        	System.out.println("tableList"+tableList);
        	model.addAttribute("tableList", tableList);
            path = "AdminOrderListByTable";
        } catch (Exception e){
            model.addAttribute("title", "테이블별 주문 내역 조회 - 에러");
            model.addAttribute("message", "문제 내용 - 테이블별 주문 목록 불러오기 중 에러발생");
        }
        return path;
    }
    
    // 테이블별 주문 메뉴 상세조회
    @GetMapping("/selectTable.do")
    public String doSelectTable(String tableNumber, Model model, HttpSession session) {
    	String path = "Error";
    	try {
    		System.out.println(tableNumber);
    		List<OrderList> orderList = orderListService.viewOrderDetail(tableNumber);
    		System.out.println(orderList);
            System.out.println("[selectTable]: "+session.getAttribute("account"));
        	model.addAttribute("orderList", orderList);
        	path = "TableOrderDetail";
    	} catch (Exception e) {
    		model.addAttribute("title", "테이블별 주문 내역 조회 - 에러");
           model.addAttribute("message", "문제 내용 - 테이블별 주문 목록 불러오기 중 에러발생");
    	}
    	return path;
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
                    System.out.println(orderListService.addOrder(orderList));
    			}
    		}
    		path = "Pay";
    	}catch(Exception e) {
    		model.addAttribute("title", "주문 하기 - 에러");
            model.addAttribute("message", "문제 내용 - 주문 하기 실행 중 에러발생");
    	}
    	return path;
    	
  }
}