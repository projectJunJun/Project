<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JJC ADMIN</title>
</head>
<body>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>JJC ADMIN</title>
    <style>
        .grid-container{
            display: grid;
            gap: 30px;
            padding: 30px;
            align-content: space-evenly;
            grid-template-columns: auto auto auto;
        }
        .grid-container > div{
            border: 1px solid black;
            text-align: center;
            font-size: 30px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"/>
    <div class="grid-container">
        <a href="AdminMenu.jsp">
            <div>
                메뉴관리
            </div>
        </a>
        <a href="AdminAccount.jsp">
            <div>
                주문계정 관리
            </div>
        </a>
        <a href="AdminOrderList.jsp">
            <div>
                주문내역 조회
            </div>
        </a>
    </div>

</body>
</html>
