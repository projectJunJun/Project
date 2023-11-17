<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #text{
 			margin-top:10%;
            display: grid;
            justify-items: center;
            align-items: center;
            font-size: 25px;
        
 }
#logout-form {
            align-self: flex-start;
            display: grid;
            justify-items: center;
            align-items: center;
        }
        .logout-form-field {
            width: 19%;
            border: none;
            border-bottom: 3px solid #ff9933;
            margin-bottom: 10px;
            border-radius: 3px;
            outline: none;
            padding: 0px 0px 5px 5px;
        }

        #logout-form-submit {
            width: 20%;
            padding: 7px;
            border: none;
            border-radius: 30px;
            color: white;
            font-weight: bold;

            background-color: #3a3a3a;
            cursor: pointer;
            outline: none;
        }
</style>

</head>
<jsp:include page="Header.jsp"/>
<body>
<div id="text">
현재 계정의 비밀번호를 입력해 주세요.<br><br>
</div>
<form id="logout-form" name="loginField" method="post" action="logout.do">
<input type="password" name="password" id="password"  required="required"  class="logout-form-field" placeholder="Password">
<input type="submit" value="로그아웃" id="logout-form-submit">
</body>
</html>