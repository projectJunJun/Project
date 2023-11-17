<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#adminmode {
  border-radius: 50px;
  border : 3px solid #FF7B31;
  color: white;
  padding: 12px 16px;
  font-size: 32px;
  color : #FF7B31;
  cursor: pointer;
  position : absolute;
  display: flex;
  top : 38px;
  left : 85%;
}
a{
text-decoration-line: none 
}
</style>
</head>
<header>
  <img src= "./images/junjunlogo.png" width="350" height="143">
  <a href="UserLogout.jsp"><button id ="adminmode"class="btn"><img src="./images/adminmode.png" width="50" height="50">  관리자 모드</button></a>
  </header>
</html>