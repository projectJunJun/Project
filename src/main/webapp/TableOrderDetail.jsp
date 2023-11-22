<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/table_h.css">
	 <style>
		 body{
			 font-family: 'IBM Plex Sans KR', sans-serif;
		 }
	 </style>
<title>주문 목록 테이블별 상세 보기</title>
	<link rel="icon" href="images/logo.PNG">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
	<meta name='viewport' content='width=device-width, initial-scale=1'>
</head>
<body>
	<jsp:include page="AdminHeader.jsp"/>
	<div class="content">
		<div class="button-container">
			<div class="selectAllOrder">
				<a class="btn" href="selectAllOrder.do">전체 조회</a>
			</div>
			<div class="selectOrderByTable">
				<a class="btn" href="selectOrder.do">테이블별 조회</a>
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
					<td><fmt:formatNumber value="${order.menu.price}" pattern="#,###"/>원</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>