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
  border : 3px solid #FF7B31;
  padding: 12px 16px;
  font-size: 22px;
  color : #FF7B31;
  cursor: pointer;
  display: inline-flex;
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
  <h2>${account.tableNumber}번 테이블</h2>
  <a href="UserLogout.jsp"><button id ="adminmode"class="btn"><img src="./images/adminmode.png" width="40" height="40" style=margin-right:15px ">  관리자 모드</button></a>
</header>
</html>