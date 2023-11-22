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
	<form method="post" action="registerAccount.do">
	<table>
		<tr>
		<td>계정ID</td>
			<td>
				<input class="content_input" type="text" name="userId" required/>  
			</td>
		  </tr>
		  <tr>
			<td>비밀번호</td>
			<td>
				<input class="content_input" type="text" name="password" required/>
			</td>
		  </tr>
		  <tr>
			<td>테이블번호</td>
			<td>
				<input class="content_input" pattern="[0-9]+" type="text" name="tableNumber" required/>
			</td>
		  </tr>  
	  </table>
	  <input class="btn" type="submit" value="계정등록" />
	  <a class="btn" href="selectAllAccount.do">목록으로 돌아가기</a>
	  </form>
	  </div>
</body>
</html>