<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>주문 내역 상세 조회</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"/>
    <div class="container">
        ${orderList.orderId}
        ${orderList.userId}
        ${orderList.menuId}
        ${orderList.teamId}
        ${orderList.orderTime}
        ${orderList.count}
        ${orderList.star}
        ${orderList.isPaid}
    </div>
    <br>
    <a href="selectAllOrder.do"><input type="button" value="목록 보기"></a>
</body>
</html>
