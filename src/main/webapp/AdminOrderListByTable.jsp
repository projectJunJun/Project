<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>테이블별 주문내역 보기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/common.css">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>준준치킨에 오신 것을 환영합니다</title>
    <link rel="icon" href="images/logo.PNG">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body{
            font-family: 'IBM Plex Sans KR', sans-serif;
        }
        .content{
            width: 75%;
        }
        .table-flex-container{
            padding-top: 20px;
            height: 500px;
            display: flex;
            flex-wrap: wrap;
            align-content: space-around;
        }
        .table-flex-child{
            justify-content: center; /* 가로 정렬을 위한 속성 */
            width: 25%;
            height: 100px;
            padding: 10px;
            outline: 15px solid #ff9933;
            border-radius: 10px;
            align-content: center;
            margin: 0 auto;
            text-align: center;
        }
        .text-box-tableNumber{
            font-weight: bold;
            font-size: 20px;
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
    <!-- 테이블별 flex 생성 -->
    <div class="table-flex-container">
        <c:forEach items="${accountList}" var="account">
            <c:if test="${account.tableNumber ne 0}">
                <a class="table-flex-child" href="selectTable.do?tableNumber=${account.tableNumber}">
                    <div class="text-box-tableNumber">테이블 #${account.tableNumber}
                    <c:forEach items="${tableList}" var="table">
                        <c:if test="${table.tableNumber eq account.tableNumber}">
                            <c:if test="${!empty table}">
                                <br><br>
                                <fmt:formatNumber value="${table.totalPrice}" pattern="#,###"/>원 /
                                ${table.countMenu}개 주문
                            </c:if>
                        </c:if>
                    </c:forEach>
                </div>
                </a>
                <br>
            </c:if>
        </c:forEach>
    </div>
</body>
</html>
