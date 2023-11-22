<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/table_h.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>준준치킨에 오신 것을 환영합니다</title>
	<link rel="icon" href="images/logo.PNG">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
	<style>
		body{
			font-family: 'IBM Plex Sans KR', sans-serif;
		}
	</style>

</head>
<body>
<jsp:include page="AdminHeader.jsp"/>
<div class="content">
    <table>
		<thead>
			<tr>
				<th>계정 ID</th>
				<th>테이블번호</th>
				<th>삭제</th>
			</tr>
		</thead>
	    <tbody>
			<c:forEach items="${accountList}" var="account">
			<tr>
				<td><a href = "selectAccount.do?userId=${account.userId}">${account.userId}</a></td>
				<td>${account.tableNumber}</td>
				<td><input type="checkbox" data-userId="${account.userId}"></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a class="btn" href= "#" id="selectedDel">선택항목삭제</a>
	<a class="btn" href = "registerAccount.do">계정 등록하기</a>
</div>
</body>
<script type="text/javascript">
	$('#selectedDel').click(function() {
		var param='';
		
		if (confirm("계정을 삭제하겠습니까?") == true){
			$('input[type=checkbox]:checked').each(function(index, item) {
				param=param + "&list=" + $(item).attr('data-userId');
			});
			
			// 비동기 연결
			$.ajax({
				type:'post',
				url:'deleteAjax.do',
				data:param,
				
				success:function(result){
					location.reload();
				}
			});
		} else {
			return;
		}
		
	})
</script>
</html>
