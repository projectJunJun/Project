<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>준준치킨에 오신 것을 환영합니다</title>
	<link rel="icon" href="images/logo.PNG">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/table_v.css">
    <style>
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