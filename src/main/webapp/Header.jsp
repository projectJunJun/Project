<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#adminmode {
  border-radius: 50px;
  background-color:white;
  border : 3px solid #ff9933;
  padding: 12px 16px;
  font-size: 24px;
  color : #ff9933;
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
#table h1 {
    font-size: 28px;
    font-weight: 500;
    letter-spacing: 0;
    line-height: 1.5em;
    padding-bottom: 15px;
    position: relative;
}
#table h1:before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    height: 5px;
    width: 55px;
    background-color: #ff9933;
}
#table h1:after {
    content: "";
    position: absolute;
    left: 0;
    bottom: 2px;
    height: 1px;
    width: 95%;
    max-width: 255px;
    background-color: #ff9933;
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
            <div id="table"><h1>${account.tableNumber}번 테이블</h1></div>
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