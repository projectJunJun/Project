<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>준준치킨에 오신 것을 환영합니다</title>
	<link rel="icon" href="images/logo.PNG">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/table_v.css">
	<style type="text/css">
		body{
			font-family: 'IBM Plex Sans KR', sans-serif;
		}
		.content {
			width: 35%;
		}
	</style>
</head>
<body>

<jsp:include page="AdminHeader.jsp"/>
<div class="content">
	<table>
	    <tbody>
			<tr>
				<td>계정 ID</td>
				<td>${account.userId}</td>
			</tr>
			<tr>
				<td>테이블 #</td>
				<td>${account.tableNumber}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${account.password}</td>
			</tr>
		</tbody>
	</table>
	<a class="btn" href = "updateAccount.do?userId=${account.userId}&tableNumber=${account.tableNumber}">수정하기</a>
	<a class="btn" href = "selectAllAccount.do">목록 보기</a>
</div>
</body>
</html>