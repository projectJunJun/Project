<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8">
      <meta name='viewport' content='width=device-width, initial-scale=1'>
      <title>메뉴 상세 페이지</title>
      <style>
          #flex-box {
              display: flex;
              flex-wrap: wrap;
              justify-content: center;
              margin: 50px 150px;
          }
          #selection {
              display: flex;
              justify-content: center;
              width: 300px;
              border: 1px solid #aaaaaa;
              border-radius: 5px;
          }
          #star {
              width: 22px;
              height: 22px;
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
          a {
              text-decoration-line: none
          }
          #menu_img{
            height:400px;
            width:600px;
            object-fit: contain;
          }
          #content_box{
              display: flex;
              flex-direction: column;
              justify-content: space-evenly;
              width:600px;
              height: 400px;
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
              cursor: pointer;
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
              text-align: center;
          }
          #price{
              font-size:20px;
              color: rgb(128, 128, 128);
              text-align: center;
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
            let thisPrice = parseInt(price.innerText.replace(/,/g , ''))
            let totalPrice = count.value*thisPrice
            document.querySelector('.doOrder').innerText = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+" 원 담기"
            e.preventDefault()
        })
        plus.addEventListener("click", e => {
            let thisPrice = parseInt(price.innerText.replace(/,/g , ''))
            count.value = parseInt(count.value)+1
            totalPrice = count.value*thisPrice
            document.querySelector('.doOrder').innerText = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+" 원 담기"
            e.preventDefault()
        });
        $('.doOrder').click(function() {
          menu_info = $(this).val()
          let currentCount = Number(count.value)
          if(localStorage.getItem($(this).attr("id"))){
              const [url, name, price, cnt] = localStorage.getItem($(this).attr("id")).split(',')
              currentCount+= Number(cnt)
          }
          menu_info +=", "+currentCount
          localStorage.setItem($(this).attr("id"), menu_info) 
          alert("주문하신 상품이 장바구니에 추가 되었습니다.")
          location.href = "selectMenuByCategory.do"
        });
      });
  </script>
  </head>
  <jsp:include page="Header.jsp"/>
  <body>
    <div id="flex-box">
        <img src="${menu.url}" id="menu_img">
        <div id="content_box">
            <div id="name">
              ${menu.name}
              <c:choose>
                <c:when test="${menu.countStar==0}">
                (미평가)
                </c:when> 
                <c:otherwise>
                <img src="./images/star.png" id=star><fmt:formatNumber value="${menu.totalStar/menu.countStar}" pattern=".00"/>
                </c:otherwise>
              </c:choose>
            </div>
            <div id="price"><fmt:formatNumber value="${menu.price}" pattern="#,###"/>원 </div>
            <div id="description">${menu.description}</div>
            <div id="button_set">
            <div id="selection">
                <button id="minus">-</button>
                <input type="number" value="1" id="count" name="count" >
                <button id="plus">+</button>
            </div>
            <button type="button" class="doOrder" id="${menu.menuId}" value="${menu.url}, ${menu.name}, ${menu.price}">
              <fmt:formatNumber value="${menu.price}" pattern="#,###"/>원 담기
            </button>
        </div>
    </div>
  </body>
</html>