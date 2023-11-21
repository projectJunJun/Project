<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
		body {
			font-family: Arial, sans-serif;
			width: 50%;
			font-size: 20px;
		}
        table {
        	width: 100%;
            text-align: center;
            font-size: 20px;
            border-collapse: collapse;
        }
        thead {
        	height: 40px;
            background: #ff9933;
            color: #ffffff;
            border-collapse: separate;
        }
        tbody {
            border-top: 1px solid #ff9933;
            border-bottom: 1px solid #ff9933;
        }
        tr td {
            height: 40px;
            border: 1px solid #ff9933;
        }
	    td:first-child { /* Target the first td element in each tr */
	   		width: 200px; /* Set the width to 100px */
	    }
	    .btn {
	    	float: right;
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 0px 10px 10px;
            text-align: center;
            text-decoration: none;
            background-color: orange; /* Orange button color */
            color: white;
            border-radius: 10px;
        }

        .btn:hover {
            background-color: #ff8c00; /* Darker orange color on hover */
        }

        a {
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"/>
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
</body>
<script type="text/javascript">
	$('#selectedDel').click(function() {
		var param='';
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
	})
</script>
</html>
