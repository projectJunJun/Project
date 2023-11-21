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
        padding-bottom: 30px;
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
        // 로그아웃 버튼이 클릭되었을 때 실행할 동작
        alert('로그아웃 되었습니다.'); // Alert 창 띄우기
        // 여기에 로그아웃을 처리하는 로직 추가
        // 처음 페이지로의 리다이렉션
        setTimeout(function () {
            window.location.href = 'logoutAdmin.do';
        }, 0); // 3000 밀리초 = 3초
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
                <c:when test="${!empty account}">
                    <div class="flex-item-login-text2">
                            ${account.userId} 님 로그인 되었습니다.
                            <button onclick="logout()">로그아웃</a></button>
                    </div>
                </c:when>
                <c:otherwise>
                    <script>
                        alert("연결된 계정이 없어 자동 로그아웃 되었습니다.")
                        // 페이지 이동
                        setTimeout(function () {
                            window.location.href = '/';
                        }, 0); // 3000 밀리초 = 3초
                    </script>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
</div>
