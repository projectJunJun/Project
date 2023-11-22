<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>준준치킨에 오신 것을 환영합니다</title>
	<link rel="icon" href="images/logo.PNG">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/table_h.css">
    <style type="text/css">
		body{
			font-family: 'IBM Plex Sans KR', sans-serif;
		}
    	.content {
    		width: 75%;
    		margin: 50px auto;
    	}
    </style>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"/>
    
    <div class="content">
    <table>
		<thead>
			<tr>
				<th>메뉴 ID</th>
				<th>메뉴 이름</th>
				<th>카테고리</th>
				<th>가격</th>
				<th>삭제</th>
			</tr>
		</thead>
	    <tbody>
			<c:forEach items="${menuList}" var="menu">
			<tr>
				<td><a href = "selectMenu.do?menuId=${menu.menuId}">${menu.menuId}</a></td>
				<td>${menu.name}</td>
				<td>${menu.category}</td>
				<td><fmt:formatNumber value="${menu.price}" pattern="#,###"/>원</td>
				<td><input type="checkbox" data-menuId="${menu.menuId}"></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a class="btn" href="#" id="selectedDel">선택항목삭제</a>
	<a class="btn" href = "addMenu.do">메뉴 추가하기</a>
	</div>
</body>

<script type="text/javascript">
	$("#selectedDel").click(function () {
		var param = '';
		
		if (confirm("계정을 삭제하겠습니까?") == true){
		
			$('input[type = checkbox]:checked').each(function (index,item) { /* 체크 박스 선택한 값들만 */
				param=param+"&menuId="+$(item).attr('data-menuId');
			}) 
			/* 비동기 연결 */
			$.ajax ({
				type: 'post',
				url: 'deleteMenuAjax.do',
				data: param,
				
				success:function(result) {
					location.reload();
				}
			});
		} else {
			return;
		}
		
	});
</script>

</html>
