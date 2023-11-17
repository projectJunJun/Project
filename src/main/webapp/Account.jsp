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
	주문계정ID:  ${account.userId}
	테이블번호: ${account.tableNumber}
	비밀번호: ${account.password}
</body>
</html>