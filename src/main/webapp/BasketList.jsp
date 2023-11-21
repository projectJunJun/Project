<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/basic.css"/>
<style>
	main {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	table {
		width: 80%;
	}
	th, td {
		min-width: 100px;
	}
	.name {
		width: 400px;
	}
	.price, .cnt {
		text-align: right;
	}
	.close {
		text-align: center;
	}
	.menu_image{
		width:180px; height:200px;
	}
	a {
		text-decoration-line: none ;
	}
	table
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		refreshPage();
		// on 선택자는 기존 html에서 있는 것으로 해야한다.
		$('#content').on('click', '#deleteBasket', deleteStorage);

	});
	function refreshPage(){
		let html="";
		let totalPrice = 0;
		for(let key in localStorage){
			if (key === "length")break;

			let data = localStorage.getItem(key).split(",");
			html +='<tr><td><img class=menu_image src='+data[0]+'></td><td class="name">'+data[1]+'</td>'+
			'<td class="price">'+data[2]+'</td><td class="cnt">'+data[3]+'</td><td class="close"><button id=deleteBasket value='+key+
			'>X</button></td></tr>';
			totalPrice += parseInt(data[2])*parseInt(data[3]);
		}//for
		$('#content').html(html);
		$('#price').html("총 주문 가격 "+totalPrice);
	}

	function deleteStorage(){
		let y = confirm($(this).val()+" 을 삭제하시겠습니까?");
		if(y){
			localStorage.removeItem($(this).val());
			refreshPage();
		}
	}

	$(function() {
		$('#doOrder').click(function(){
			let url = "updateOrderList.do?idList="
			let idList = []
			let countList =[]
			for(let key in localStorage){
				if (key === "length")break;
				let data=localStorage.getItem(key).split(',')
				idList.push(key)
				countList.push(data[3])
			}
			url+=idList+"&countList="+countList
			location.href = url
		});
	});
</script>
</head>
<jsp:include page="Header.jsp"/>

<body>
	<main>
		<section>
			<table>
				<caption class="caption">장바구니 | 테이블 ${account.tableNumber}</caption>
				<thead>
					<tr><th></th><th>이름</th><th>가격</th><th>수량</th><th>X</th></tr>
				</thead>
				<tbody id="content">
				</tbody>
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
	</main>
</body>
</html>