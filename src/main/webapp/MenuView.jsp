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
         #menu_img{
         	margin-left:150px;
            margin-top:50px;      
         	height:400px;
         	width:40%;
         }
         #content_box{         
         margin-top:50px;
         width:40%;
         height:30%;
         margin-right:150px;
			float: right;
			clear: both;
         }
         .doOrder{
         margin-top:20px;
         align-items:center;
         width : 300px;
         border-radius : 20px;
         height : 50px;
         border : none;
         font-size: 24px;
         background-color: #FF7B31;
         color:white;
         }
         #button_set{
         align-items:center;
         margin-top:100px;
         display: flex;
         flex-direction: column;
         }
         #name{
         font-weight: bold;
         font-size: 24px;
       
         }
         #price{
         font-size:20px;
         color: gray;
         
         }
         #description{
         text-align:center;
         font-size:22px;
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
            alert("주문하신 상품이 장바구니에 추가 되었습니다.")
    		location.href = "selectMenuByCategory.do"

        });
    });
</script>
</head>
<jsp:include page="Header.jsp"/>
<body>
<img src="${menu.url}" id="menu_img">
<div id="content_box">
<div id="name" align="center">
	${menu.name}
</div>
<br>
<div id="price" align="center">
${menu.price}원 
</div>
<br>
<div id="description">
${menu.description}
</div>
<div id="button_set">
<div id="selection">
    <button id="minus">-</button>
    <input type="number" value="1" id="count" name="count" >
    <button id="plus">+</button>
</div>
<button type="button" class="doOrder" id="${menu.menuId}" value="${menu.url}, ${menu.name}, ${menu.price}">${menu.price} 원 담기</button>
</div>
</div>
<br><br>	
<hr>
</html>