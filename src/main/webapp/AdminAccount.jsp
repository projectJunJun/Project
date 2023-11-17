<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"/>
    <table>
		<thead>
			<tr>
				<th>계정 ID</th>
				<th>테이블번호</th>
				<th>삭제</th>
			</tr>
		</thead>
	    <tbody>
			<c:forEach items="${accountList}" var="account">
			<tr>
				<td><a href = "selectAccount.do?userId=${account.userId}">${account.userId}</a></td>
				<td>${account.tableNumber}</td>
				<td><input type="checkbox" data-num="${account.userId}"></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a href = "registerAccount.do">계정 등록하기</a>
    
</body>
</html>
