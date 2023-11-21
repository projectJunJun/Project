<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="AdminHeader.jsp"/>
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
	<a href = "selectAllAccount.do">목록 돌아가기</a>  <a href = "updateAccount.do?userId=${account.userId}&tableNumber=${account.tableNumber}">계정 수정하기</a>
</body>
</html>