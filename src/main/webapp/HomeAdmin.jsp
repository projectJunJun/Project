<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>JJC ADMIN</title>
    <style>
        .grid-container{
            width: 80%;
            display: grid;
            gap: 30px;
            padding-top: 5%;
            margin: 0 auto;
            align-content: space-evenly;
            grid-template-columns: auto auto auto;

        }
        .grid-container-child{
            margin: 0 auto;
        }
        .grid-content{
            text-align: center;
            font-size: 30px;
        }
        .grid-container-child > a{
            align-content: center;
            color: black;
            text-decoration: none;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"/>
    <div class="grid-container">
        <a href="selectAllMenu.do">
            <div>
                메뉴관리
            </div>
        </a>
        <a href="selectAllAccount.do">
            <div>
                주문계정 관리
            </div>
        </a>
        <a href="selectAllOrder.do">
            <div>
                주문내역 조회
            </div>
        </a>
    </div>
</body>
</html>
