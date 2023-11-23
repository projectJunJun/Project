<%@ page import="java.util.prefs.Preferences" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>결제 진행중</title>
    <link rel="icon" href="images/logo.PNG">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <style>
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #ccc;
            font-family: 'IBM Plex Sans KR', sans-serif;
        }

        form {
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 750px;
            height: 750px;
            background-color: #fff;
            box-shadow: 0 0 50px #aaa;
        }

        #close {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            background-color: #FFFFFF;
            border: 0;
            font-size: 32px;
        }
        #close:hover {
            font-weight: bold;
            cursor: pointer;
        }

        h1 {
            font-size: 28px;
        }

        h2 {
            font-size: 24px;
            color: #aaa;
        }

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

        p {
            font-size: 16px;
        }

        #pay {
            width: 400px;
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            background-color: #ff9933;
            border: 0;
            border-radius: 5px;
            padding: 10px;
        }
        #pay:hover {
            background-color: #ff8833;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form action="/pay.do" method="GET">
        <button id="close">X</button>
        <h1>결제하시겠습니까?</h1>
        <h2><fmt:formatNumber value="${total}" pattern="#,###"/>원</h2>
        <h3>결제 인원을 선택해주세요</h3>
        <div id="selection">
            <button id="minus">-</button>
            <input type="number" value="1" id="people" name="people" >
            <button id="plus">+</button>
        </div>
        <p>나눠지지 않는 금액은 마지막 인원의 결제에 부과됩니다.</p>
        <input type="submit" value="결제 금액 확인 " id="pay">
    </form>
    <script>
        const close = document.querySelector("#close")
        close.addEventListener("click", e => {
            location.href = 'BasketList.jsp'
            e.preventDefault()
        })

        // +/- 누르면 숫자 올라가게
        const minus = document.querySelector("#minus")
        const plus = document.querySelector("#plus")
        const people = document.querySelector("#people")
        minus.addEventListener("click", e => {
            if(people.value > 1) people.value -= 1
            e.preventDefault()
        })
        plus.addEventListener("click", e => {
            people.value = parseInt(people.value)+1
            e.preventDefault()
        })
    </script>
</body>
</html>
