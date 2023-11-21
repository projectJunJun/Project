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
	
	<form method="post" action="updateAccount.do">
		<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
			<tr>
				<td width=120 align=center bgcolor="E6ECDE" height="22">계정 ID</td>
				<td width=490 bgcolor="ffffff" style="padding-left:10">
					<input type="text" style="width:150" name="userId" value="${param.userId}" readonly/>  
				</td>
			</tr>
			<tr>
				<td width=120 align=center bgcolor="E6ECDE" height="22">테이블 번호</td>
				<td width=490 bgcolor="ffffff" style="padding-left:10">
					<input type="text" style="width:150" name="tableNumber" value="${param.tableNumber}"/>
				</td>
			</tr>
			<tr>
				<td width=120 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
				<td width=490 bgcolor="ffffff" style="padding-left:10">
					<input type="text" style="width:240" name="password"/>
				</td>
			</tr>
			<tr>
				<td width=120 align=center bgcolor="E6ECDE" height="22">비밀번호 확인</td>
				<td width=490 bgcolor="ffffff" style="padding-left:10">
					<input type="text" style="width:240" name="passwordCheck"/>
				</td>
			</tr>
		</table>
	<input type="submit" value="계정 수정" />
	<input type="reset" value="취소" />
	</form>
</body>
</html>