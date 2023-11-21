<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"/>
    
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
				<td>${menu.price}</td>
				<td><input type="checkbox" data-menuId="${menu.menuId}"></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a href = "addMenu.do">메뉴 추가하기</a>
	<a href="#" id="selectedDel">선택항목삭제</a>
</body>

<script>
	$("#selectedDel").click(function () {
		var param = '';
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
		
	});
</script>

</html>
