<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/table_v.css">
<style type="text/css">
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
				<td>${menu.price}</td>
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