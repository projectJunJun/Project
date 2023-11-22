<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/table_h.css">
    <style type="text/css">
    
    	.content {
    		width: 75%;
    		margin: 50 auto;
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
				<td>${menu.price}</td>
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
