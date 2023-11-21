<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    .flex-container{
        width: 90%;
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
    }
    .flex-item-login{
        text-align: right;
        padding-bottom: 30px;
    }
    .flex-item-group {
        display: inline-flex;
        align-items: center;
    }
    .flex-item-login-text1{
        padding-bottom: 10px;
        font-size: 30px;
        font-weight: bold;
    }
    .flex-item-login-text2{
        font-weight: bold;
    }
    .flex-item-login-img {
        height: 30px;
        width: 30px;
        padding-right: 10px;
    }
</style>
<div class="flex-container">
    <div id="flex-item-logo">
        <a href="HomeAdmin.jsp">
            <img src="images/junjunlogo.png">
        </a>
    </div>
    <div class="flex-item-login">
        <div class="flex-item-group">
            <img class="flex-item-login-img" src="images/adminmode.png">
            <div class="flex-item-login-text1">관리자 페이지</div>
        </div>
        <c:if test="${!empty account}">
            <div class="flex-item-login-text2">
                    ${account.userId} 님 로그인 되었습니다. <a href="logoutAdmin.do">로그아웃</a>
            </div>
        </c:if>
    </div>
</div>
