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
            border: 1px solid #ff9933;
            padding: 20px;
            outline: 10px solid #ff9933;
            border-radius: 10px;
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
        .admin-home-img-container {
            width: 250px;
            height: 250px;
            object-fit: cover;
            margin-bottom: 10px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"/>
    <div class="grid-container">
    <div class="grid-container-child">
        <a href="showAllMenu.do">
            <img class="admin-home-img-container" src="https://images.unsplash.com/photo-1557499305-bd68d0ad468d?q=80&w=1924&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
            <div class="grid-content">
                메뉴관리
            </div>
        </a>
    </div>

    <div class="grid-container-child">
        <a href="selectAllAccount.do">
            <img class="admin-home-img-container" src="https://images.unsplash.com/photo-1634474588578-7f0565a1cea5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
            <div class="grid-content">
                주문계정 관리
            </div>
        </a>
    </div>

    <div class="grid-container-child">
        <a href="selectAllOrder.do">
            <img class="admin-home-img-container" src="https://images.unsplash.com/photo-1603880921125-88ce2fc04673?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8JUVDJUEzJUJDJUVCJUFDJUI4fGVufDB8fDB8fHww">
            <div class="grid-content">
                주문내역 조회
            </div>
        </a>
    </div>
    </div>

</body>
</html>
