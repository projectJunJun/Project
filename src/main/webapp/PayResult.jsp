<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>결제 금액 안내</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <style>
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #ccc;
        }

        main {
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

        input {
            width: 400px;
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            background-color: #ff9933;
            border: 0;
            border-radius: 5px;
            padding: 10px;
        }
        input:hover {
            background-color: #ee8822;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <main>
        <h1>결제 금액 안내</h1>
        ${total}원
        ${people}명
        <%-- TODO: JAVA에서 계산된 리스트로 표로 보여주기 --%>
        <h2>총 결제 금액</h2>
        <input type="submit" value="결제하기">
    </main>
    <script>
        const button = document.querySelector("input")
        button.addEventListener("click", () => {
            location.href = 'Star.jsp'
        })
    </script>
</body>
</html>
