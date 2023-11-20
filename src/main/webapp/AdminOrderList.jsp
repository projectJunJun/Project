<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>주문내역 조회</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
        table{
            margin-left: 20px;
            font-size: 20px;
            text-align: center;
        }
    </style>
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
                <a href="selectAllOrder.do">
                    테이블별 조회
                </a>
            </button>
        </div>
    </div>
    <div class="empty-container"></div>
    <!-- 목록 조회 table 생성 -->
    <table>
        <thead>
            <tr>
                <th>주문 ID</th>
                <th>테이블 ID</th>
                <th>메뉴 ID</th>
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
                    <td><a href="orderListDetail.do?orderId=${orderList.orderId}">${orderList.orderId}</a></td>
                    <td>${orderList.userId}</td>
                    <td>${orderList.menuId}</td>
                    <td>${orderList.teamId}</td>
                    <td>${orderList.orderTime}</td>
                    <td>${orderList.count}</td>
                    <td>${orderList.star}</td>
                    <td>${orderList.isPaid}</td>
                </tr>
            </c:forEach>
        </tbody>

    </table>

</body>
</html>
