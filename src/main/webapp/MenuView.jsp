<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#selection {
            display: flex;
            justify-content: center;
            width: 300px;
            border: 1px solid #aaaaaa;
            border-radius: 5px;
        }

        #minus, #plus {
            width: 70px;
            padding: 10px;
            font-size: 20px;
            background-color: rgba(0, 0, 0, 0);
            border: 0px;
        }
        #minus:hover, #plus:hover {
            background-color: #ddd;
            cursor: pointer;
        }

        /* input(number) 오른쪽 화살표 없애기 */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type=number] {
            -moz-appearance: textfield;
            text-align: center;
            width: 200px;
            font-size: 20px;
            border: 0px;
        }
        a{
text-decoration-line: none 
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
const minus = document.querySelector("#minus")
const plus = document.querySelector("#plus")
const count = document.querySelector("#count")
const price = document.querySelector("#price")
minus.addEventListener("click", e => {
    if(count.value > 1) count.value -= 1
	let thisPrice = parseInt(price.innerText)
    let totalPrice = count.value*thisPrice
    document.querySelector('.doOrder').innerHTML = totalPrice+" 원 담기"
    e.preventDefault()
})
plus.addEventListener("click", e => {
	let thisPrice = parseInt(price.innerText)
	count.value = parseInt(count.value)+1
	totalPrice = count.value*thisPrice
	document.querySelector('.doOrder').innerHTML = totalPrice+" 원 담기"
    e.preventDefault()
});
	$('.doOrder').click(function() {
		menu_info = $(this).val()
		menu_info += ", "+count.value
		localStorage.setItem($(this).attr("id"), menu_info)
	});
});
</script>
</head>
<jsp:include page="Header.jsp"/>
<body>
<img src="${menu.url}">
<div id="name">
	${menu.name}
</div>
<br>
<div id="price">
${menu.price}원 
</div>
<br>
<hr>
<div id="description">
${menu.description}
</div>
<div id="selection">
            <button id="minus">-</button>
            <input type="number" value="1" id="count" name="count" >
            <button id="plus">+</button>
        </div>
<button type="button" class="doOrder" id="${menu.menuId}" value="${menu.url}, ${menu.name}, ${menu.price}">${menu.price} 원 담기</button>
</html>
