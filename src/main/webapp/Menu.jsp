<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/table_v.css">
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>준준치킨에 오신 것을 환영합니다</title>
	<link rel="icon" href="images/logo.PNG">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
<style type="text/css">
	body{
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	.content {
		width: 40%;
	}
</style>
</head>
<body>
	<jsp:include page="AdminHeader.jsp"/>
	<div class="content">
		<table>
			<tr>
				<td>메뉴 ID</td>
				<td>${menu.menuId}</td>
			</tr>
			<tr>
				<td>메뉴 이름</td>
				<td>${menu.name}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>${menu.category}</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><fmt:formatNumber value="${menu.price}" pattern="#,###"/>원</td>
			</tr>
			<tr>
				<td>설명</td>
				<td>${menu.description}</td>
			</tr>
		</table>
		<a class="btn" href="updateMenu.do?menuId=${menu.menuId}">메뉴수정하기</a>
		<a class="btn" href="selectAllMenu.do">목록으로 돌아가기</a>
	</div>
</body>
</html>