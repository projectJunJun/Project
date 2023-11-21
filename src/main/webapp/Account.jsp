<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            font-size: 20px;
			width: 50%;
		}
        table {
        	width: 100%;
            text-align: center;
            font-size: 20px;
            border-collapse: collapse;
        }
        thead {
            background: #ff9933;
            color: #ffffff;
            border-collapse: separate;
        }
        tbody {
            border-top: 1px solid #ff9933;
            border-bottom: 1px solid #ff9933;
        }
        tr td{
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
    <tbody>
		<tr>
			<td>계정 ID</td>
			<td>${account.userId}</td>
		</tr>
		<tr>
			<td>테이블 #</td>
			<td>${account.tableNumber}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${account.password}</td>
		</tr>
	</tbody>
</table>
<a class="btn" href = "selectAllAccount.do">목록 돌아가기</a>  <a class="btn" href = "updateAccount.do?userId=${account.userId}&tableNumber=${account.tableNumber}">계정 수정하기</a>
</body>
</html>