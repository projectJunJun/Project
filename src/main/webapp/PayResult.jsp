<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>결제 금액 안내</title>
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
            box-sizing: border-box;
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
            box-shadow: 0px 0px 50px #aaa;
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
        table {
            text-align: center;
            font-size: 20px;
            border-collapse: collapse;
        }
        thead {
            background: #ff9933;
            color: #ffffff;
            border-collapse: separate;
        }
        tfoot {
            color: #ff9933;
            font-weight: bold;
        }
        tbody {
            border-top: 1px solid #ff9933;
            border-bottom: 1px solid #ff9933;
        }
        tr {
            height: 40px;
        }
        .money {
            text-align: right;
            font-weight: bold;
        }
        .left {
            width: 150px;
            border-right: 1px solid #ff9933;
        }
        .right {
            width: 150px;
            text-align: right;
            padding-right: 50px;
        }
        th .left {
            border-right: 1px solid #ffffff;
            border-left: 1px solid #ffffff;
            border-collapse: separate;
        }
        input {
            width: 400px;
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            background-color: #ff9933;
            border: 0;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
        }
        input:hover {
            background-color: #ee8822;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form action="/star.do" method="post">
        <button id="close">X</button>
        <h1>결제 금액 안내</h1>
        <h2>총 결제 금액</h2>
        <table>
            <thead>
                <tr>
                    <th class="left">인원별</th>
                    <th class="right">금액</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${moneys}" var="money" varStatus="status">
                <tr>
                    <td class="left">${status.count}/${people}</td>
                    <td class="right money">${money}원</td>
                </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td class="left">${people}명</td>
                    <td class="right">${total}원</td>
                </tr>
            </tfoot>
        </table>
        <p>나눠지지 않는 금액은 마지막 인원의 결제에 부과됩니다.</p>
        <input type="submit" value="결제하기">
    </form>
    <script>
        const close = document.querySelector("#close")
        close.addEventListener("click", e => {
            location.href = 'Pay.jsp'
            e.preventDefault()
        })
        const button = document.querySelector("input")
        button.addEventListener("click", () => {
            location.href = 'Star.jsp'
        })
    </script>
</body>
</html>
