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
	
	<form method="post" action="addMenu.do">
	<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
		<td width=100 align=center bgcolor="E6ECDE" height="22">메뉴ID</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:150" name="menuId"/>  
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">메뉴이름</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:150" name="name"/>
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">카테고리</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:240" name="category"/>
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">가격</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:240" name="price"/>
			</td>
		  </tr>  
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">이미지url</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:240" name="url"/>
			</td>
		  </tr>  
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">상세설명</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:240" name="description"/>
			</td>
		  </tr>
	  </table>
	  
	  <input type="submit" value="메뉴추가" /> &nbsp;
</body>
</html>