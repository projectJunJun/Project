<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/basic.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	main {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	table {
		width: 80%;
		font-size: 18px;
		border-collapse: collapse;
	}
	.caption {
		background-color: #eee;
		color: #ff9933;
	}
	thead {
		background-color: #ff9933;
		color: #FFFFFF;
	}
	th, td {
		min-width: 80px;
		text-align: center;
	}
	.name {
		width: 400px;
		text-align: center;
	}
	.price, .cnt {
		text-align: center;
	}
	.close {
		text-align: center;
	}
	.close button {
		background-color: #FFFFFF;
		color: #ff9933;
		font-size: 24px;
		border: None;
		cursor: pointer;
		
	}
	.menu_image{
		width:150px; height:150px;
		object-fit: scale-down;
	}
	a {
		text-decoration-line: none ;
	}
	h1 {

	}
	input {
		width: 500px;
		height: 50px;
		margin-top: 10px;
		border: 0;
		border-radius: 5px;
		background-color: #ff9933;
		color: #FFFFFF;
		font-size: 18px;
		font-weight: bold;
	}
	input:hover {
		background-color: #ff8833;
		cursor: pointer;
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
		let html="";
		let totalPrice = 0;
		for(let key in localStorage){
			if (key === "length")break;

			let data = localStorage.getItem(key).split(",");
			html += '<tr><td><img class=menu_image src='+data[0]+'></td><td class="name">'+data[1]+'</td>'+
			'<td class="price">'+data[2].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</td><td class="cnt">'+data[3]+'</td><td class="close"><button class="btn" id=deleteBasket value='+key+
			'><i class="fa fa-trash"></i></button></td></tr>';
			totalPrice += parseInt(data[2])*parseInt(data[3]);
		}//for
		$('#content').html(html);
		$('#price').html("<h1>총 주문 가격 "+totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원"+"</h1>");
	}

	function deleteStorage(){
		let y = confirm($(this).closest('.close').siblings('.name').text()+" 메뉴를 삭제하시겠습니까?");
		if(y){
			localStorage.removeItem($(this).val());
			refreshPage();
		}
	}

	$(function() {
		$('#doOrder').click(function(){
			if(localStorage.length === 0){
				alert("장바구니에 메뉴를 담아주세요")
			}else{
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
			}
		});
	});
</script>
</head>
<jsp:include page="Header.jsp"/>

<body>
	<main>
		<table>
			<caption class="caption">장바구니 | 테이블 ${account.tableNumber}</caption>
			<thead>
				<tr><th></th><th>이름</th><th>가격</th><th>수량</th><th>삭제</th></tr>
			</thead>
			<tbody id="content">
			</tbody>
		</table>
		<section  class="totalprice" id="price" >
			
		</section>
		<input type="button" id="doOrder" value="주문하기"/>
	</main>
</body>
</html>