<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>주문 목록 테이블별 보기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        button > a{
            color: #ff9933;
            text-decoration: none;
            font-size: 25px;
        }
        .button-container{
            display: flex;
            margin-left: 20px;
        }
        button{
            height: 75px;
            width: 240px;
            margin-left: 10px;
            margin-right: 10px;
            border-radius: 25px;
            border: 3px solid #ff9933;
            background-color: #F5EFEF;
        }
        .empty-container{
            height: 20px;
        }
        .container{
            display: flex;
            flex-wrap: wrap;
        }
    </style>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"/>
    <div class="button-container">
        <div class="selectAllOrder">
            <button id="button-selectAllOrder">
                <a href="selectAllOrder.do">
                    전체 조회
                </a>
            </button>
        </div>
        <div class="selectOrderByTable">
            <button id="button-selectOrderByTable">
                <a href="selectOrder.do">
                    테이블별 조회
                </a>
            </button>
        </div>
    </div>
    <div class="empty-container"></div>
    <!-- 테이블별 flex 생성 -->
    <div class="container">
    <table>
    	<tr>
    		<th>테이블번호</th>
    		<th>총합가격</th>
    		<th>주문 메뉴 수</th>
    	</tr>
    	
	   	<c:forEach items="${accountList}" var="account">
	    	<tr>
	    		<c:if test="${account.tableNumber ne 0}">    		
	             	<td><a href = "selectTable.do?tableNumber=${account.tableNumber}">${account.tableNumber}</a></td>
	            </c:if>			
			<c:forEach items="${tableList}" var="table">
				<c:if test="${table.tableNumber eq account.tableNumber}">        	
			         	<td>${table.totalPrice}</td>
			         	<td>${table.countMenu}</td>
		    	</c:if>            
	    	</c:forEach>
	    	</tr>	        
	  	</c:forEach>
		         
        
    </table>
    </div>
</body>
</html>
