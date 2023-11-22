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
				<input class="content_input" type="text" name="menuId"/>  
			</td>
		  </tr>
		  <tr>
			<td>메뉴이름</td>
			<td>
				<input class="content_input" type="text" name="name" required/>
			</td>
		  </tr>
		  <tr>
			<td>카테고리</td>
			<td>
				<select class="content_input" name="category">
					<option value="치킨">치킨</option>
					<option value="사이드">사이드</option>
					<option value="음료">음료</option>
				</select>
				<!-- <input class="content_input" type="text" name="category" required/> -->
			</td>
		  </tr>
		  <tr>
			<td>가격</td>
			<td>
				<input class="content_input" pattern="[0-9]+" type="text" name="price" required/>
			</td>
		  </tr>  
		  <tr>
			<td>이미지url</td>
			<td>
				<input class="content_input" type="text" name="url" required/>
			</td>
		  </tr>  
		  <tr height="100px">
			<td>상세설명</td>
			<td>
				<textarea class="content_input" name="description" rows="" cols=""></textarea>
			</td>
		  </tr>
	  </table>
	  <input class="btn" type="submit" value="메뉴추가" />
	  <a class="btn" href="selectAllMenu.do">목록으로 돌아가기</a>
	</form>
  </div>
</body>
</html>