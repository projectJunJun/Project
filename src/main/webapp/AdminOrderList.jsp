<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>주문내역 조회</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/table_h.css">
    <style>
    	.content{
    		width: 75%;
    	}
    </style>
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
    <!-- 목록 조회 table 생성 -->
    <table>
        <thead>
            <tr>
                <th>주문 ID</th>
                <th>테이블 번호</th>
                <th>메뉴명</th>
                <th>팀 ID</th>
                <th>주문시간</th>
                <th>개수</th>
                <th>별점</th>
                <th>결제 여부</th>
            </tr>
        </thead>
        <tbody>
            <!-- forEach 사용 -->
            <c:forEach items="#{orderLists}" var="orderList">
                <tr>
                    <td>${orderList.orderId}</td>
                    <td>${orderList.account.tableNumber}</td>
                    <td>${orderList.menu.name}</td>
                    <td>${orderList.teamId}</td>
                    <td>${orderList.orderTime}</td>
                    <td>${orderList.count}</td>
                    <td>${orderList.star}</td>
                    <td>${orderList.isPaid}</td>
                </tr>
            </c:forEach>
        </tbody>

    </table>
    </div>
    <script>
        const buttonAll = document.querySelector("#button-selectAllOrder")
        buttonAll.addEventListener("click", () => {
            location.href = 'selectAllOrder.do'
        })
        const buttonTable = document.querySelector("#button-selectOrderByTable")
        buttonTable.addEventListener("click", () => {
            location.href = 'selectAccountForTable.do'
        })

    </script>
</body>
</html>
