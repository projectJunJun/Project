<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<meta charset="UTF-8">
	<style>
        button > a{
            color: #ff9933;
            text-decoration: none;
            font-size: 25px;
        }
        .button-container{
            display: flex;
            margin-left: 20px;
        }
        button{
            height: 75px;
            width: 240px;
            margin-left: 10px;
            margin-right: 10px;
            border-radius: 25px;
            border: 3px solid #ff9933;
            background-color: #F5EFEF;
        }
        .empty-container{
            height: 20px;
        }
        .container{
            display: flex;
            flex-wrap: wrap;
        }
    </style>
<title>주문 목록 테이블별 상세 보기</title>
</head>
<body>
	<jsp:include page="AdminHeader.jsp"/>
    <div class="button-container">
        <div class="selectAllOrder">
            <button id="button-selectAllOrder">
                <a href="selectAllOrder.do">
                    전체 조회
                </a>
            </button>
        </div>
        <div class="selectOrderByTable">
            <button id="button-selectOrderByTable">
                <a href="selectOrder.do">
                    테이블별 조회
                </a>
            </button>
        </div>
    </div>
    <table>
		<thead>
			<tr>
				<th>테이블번호</th>
				<th>메뉴 이름</th>
				<th>주문수량</th>
				<th>가격</th>
			</tr>
		</thead>
	    <tbody>
			<c:forEach items="${orderList}" var="order">
			<tr>
				<td>${order.account.tableNumber}</td>
				<td>${order.menu.name}</td>
				<td>${order.count}</td>				
				<td>${order.menu.price}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>