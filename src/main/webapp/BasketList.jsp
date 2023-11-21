<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/basic.css"/>
<style type="text/css">
	.menu_image{width:180px; height:200px;}
a{
text-decoration-line: none ;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	refreshPage();
	// on 선택자는 기존 html에서 있는 것으로 해야한다.
	$('#content').on('click', '#deleteBasket', deleteStorage);
	
});
function refreshPage(){
	var html="";
	var totalPrice = 0;
	for(var key in localStorage){
		if (key=="length")break;
		
		var data = localStorage.getItem(key).split(",");
		html +='<tr><td><img class=menu_image src='+data[0]+'></td><td>'+data[1]+'</td>'+
		'<td>'+data[2]+'</td><td>'+data[3]+'</td><td><button id=deleteBasket value='+key+
		'>X</button></td></tr>';
		totalPrice += parseInt(data[2])*parseInt(data[3]);
	}//for
	$('#content').html(html);
	$('#price').html("총 주문 가격 "+totalPrice);
}

function deleteStorage(){
	var y = confirm($(this).val()+" 을 삭제하시겠습니까?");
	if(y){
		localStorage.removeItem($(this).val());
		refreshPage();
	}
}

$(function() {
	$('#doOrder').click(function(){
		var url = "updateOrderList.do?idList="
		var idList = []
		var countList =[]
		for(var key in localStorage){
			if (key=="length")break;
			var data=localStorage.getItem(key).split(',')
			idList.push(key)
			countList.push(data[3])
		}
		url+=idList+"&countList="+countList
		location.href = url
	});
});

</script>
<title>Insert title here</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/basic.css"/>
    <style type="text/css">
        .poster{width:180px; height:200px;}

    </style>

    <title>Insert title here</title>
</head>
<jsp:include page="Header.jsp"/>

<body>
<article class="main">
		<section>
			<table width="80%"  align="center"  >
			<caption class="caption">장바구니 | 테이블 ${account.tableNumber}</caption>
			<thead>
				<tr><th></th><th>이름</th><th>가격</th><th>수량</th><th>삭제</th></tr>
			</thead>
			<tbody id="content">
			</tbody>
			<!-- localStorage에 있는 거 일로 받아옴. -->
			</table>
		</section>
		<section  class="totalprice" id="price" >
			
		</section>
		<section class="link">
			<table align="center">
			<tr><td align="center">
			</td></tr>
			</table>
		</section>
		<button id="doOrder">주문 하기</button>
		</article>
</body>
</html>