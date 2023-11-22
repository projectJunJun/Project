<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>준준치킨에 오신 것을 환영합니다</title>
    <link rel="icon" href="images/logo.PNG">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">
    body{
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
#adminmode {
  border-radius: 50px;
  background-color:white;
  border : 3px solid #FF7B31;
  padding: 12px 16px;
  font-size: 22px;
  color : #FF7B31;
  cursor: pointer;
  display: inline-flex;
  font-weight:bold;
  align-items: center;
  margin-right: 50px;
}
a{	
	text-decoration-line: none 
}
#logo{
	display:inline-flex;
	}
	
header{
	display:flex;
	align-items: center;
	justify-content: space-between;
}
</style>
</head>
<header>
	<div id=logo>
	<a href="selectMenuByCategory.do">
  <img src= "./images/junjunlogo.png" width="350" height="143">
 	</a>
  </div>
    <c:choose>
        <c:when test="${!empty account}">
            <h2>${account.tableNumber}번 테이블</h2>
        </c:when>
        <c:otherwise>
            <script>
                alert("연결된 계정이 없어 자동 로그아웃 되었습니다.")
                // 로그인 페이지 이동
                setTimeout(function (){
                    window.location.href = '/';
                }, 0);  // 0초,,
            </script>
        </c:otherwise>
    </c:choose>

  <a href="UserLogout.jsp"><button id ="adminmode"class="btn"><img src="./images/adminmode.png" width="40" height="40" style=margin-right:15px ">  관리자 모드</button></a>
</header>
</html>