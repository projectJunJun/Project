<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    .flex-container{
        width: 90%;
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
        margin: 0 auto;
    }
    .flex-item-login{
        flex-direction: column;
        padding-bottom: 40px;
    }
    .flex-item-group {
        display: flex;
        align-items: center;
        padding-bottom: 15px;
        justify-content: right;
    }
    .flex-item-login-text1{
        font-size: 30px;
        font-weight: bold;
    }
    .flex-item-login-text2{
        font-weight: bold;
    }
    .flex-item-login-img {
        height: 40px;
        width: 40px;
        padding-right: 10px;
    }
    button{
        margin-left: 10px;
    }
</style>
<script>
    function logout() {
        // 사용자에게 확인 메세지를 보여주기
        var confirmLogout = confirm('로그아웃 하시겠습니까?');

        // 사용자가 확인을 눌렀을 경우
        if(confirmLogout){
            window.location.href = 'logoutAdmin.do';
        }
    }
</script>
<div class="flex-container">
    <div id="flex-item-logo">
        <a href="HomeAdmin.jsp">
            <img src="images/junjunlogo.png">
        </a>
    </div>
    <div class="flex-item-login">
        <div class="flex-item-group">
            <div><img class="flex-item-login-img" src="images/adminmode.png"></div>
            <div class="flex-item-login-text1">관리자 페이지</div>
        </div>
        <div>
            <c:choose>
                <c:when test="${!empty loginAccount}">
                    <div class="flex-item-login-text2">
                            ${loginAccount.userId} 님 로그인 되었습니다.
                            <button type="submit" onclick="logout()">로그아웃</button>
                    </div>
                </c:when>
                <c:otherwise>
                    <script>
                        alert("연결된 계정이 없어 자동 로그아웃 되었습니다.")
                        // 페이지 이동
                        window.location.href = '/'; // 0초,,,
                    </script>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
