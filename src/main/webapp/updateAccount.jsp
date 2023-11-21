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
	<form method="post" action="updateAccount.do">
		<table>
			<tr>
				<td>계정 ID</td>
				<td>
					<input class="content_input" type="text" name="userId" value="${param.userId}" readonly/>  
				</td>
			</tr>
			<tr>
				<td>테이블 번호</td>
				<td>
					<input class="content_input" type="text" name="tableNumber" required value="${param.tableNumber}"/>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input class="content_input" type="text" name="password" required/>
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input class="content_input" type="text" name="passwordCheck" required/>
				</td>
			</tr>
		</table>
	<input class="btn" type="submit" value="계정 수정" />
	<input class="btn" type="reset" value="취소" />
	</form>
	</div>
</body>
</html>