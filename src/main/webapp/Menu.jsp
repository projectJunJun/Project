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
	
	메뉴 ID: ${menu.menuId}
	메뉴 이름: ${menu.name}
	카테고리: ${menu.category}
	가격: ${menu.price}
</body>
</html>