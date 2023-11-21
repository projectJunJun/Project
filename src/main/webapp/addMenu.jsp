<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/table_v.css">
<style>
	    .content {
			width: 40%;
		}
    </style>
</head>
<body>
	<jsp:include page="AdminHeader.jsp"/>
	
	<div class="content">
	<form method="post" action="addMenu.do">
	<table>
	  <tr>
		<td>메뉴ID</td>
			<td>
				<input class="content_input" type="text" style="width:150" name="menuId"/>  
			</td>
		  </tr>
		  <tr>
			<td>메뉴이름</td>
			<td>
				<input class="content_input" type="text" style="width:150" name="name"/>
			</td>
		  </tr>
		  <tr>
			<td>카테고리</td>
			<td>
				<input class="content_input" type="text" style="width:240" name="category"/>
			</td>
		  </tr>
		  <tr>
			<td>가격</td>
			<td>
				<input class="content_input" type="text" style="width:240" name="price"/>
			</td>
		  </tr>  
		  <tr>
			<td>이미지url</td>
			<td>
				<input class="content_input" type="text" style="width:240" name="url"/>
			</td>
		  </tr>  
		  <tr>
			<td>상세설명</td>
			<td>
				<input class="content_input" type="text" style="width:240" name="description"/>
			</td>
		  </tr>
	  </table>
	  <input class="btn" type="submit" value="메뉴추가" /> &nbsp;
	</form>
  </div>
</body>
</html>