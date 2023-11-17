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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
const minus = document.querySelector("#minus")
const plus = document.querySelector("#plus")
const count = document.querySelector("#count")
let price = document.querySelector("#price")
let totalPrice = 0
minus.addEventListener("click", e => {
    if(count.value > 1) count.value -= 1
    totalPrice = count.value*price
    documnet.getElementById("doOrder").value = totalPrice+" 원 담기"
    e.preventDefault()
})
plus.addEventListener("click", e => {
	count.value = parseInt(count.value)+1
	totalPrice = count.value*price
    documnet.getElementById("doOrder").value = totalPrice+" 원 담기"
    e.preventDefault()
});
	$('#doOrder').click(function() {
		localStorage.setItem($(this).attr("id"), $(this).val())
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
<div id="discription">
${menu.discription}
<div id="selection">
            <button id="minus">-</button>
            <input type="number" value="1" id="count" name="count" >
            <button id="plus">+</button>
        </div>
<input type="button" id="${menu.menuId}">
</div>
</html>
