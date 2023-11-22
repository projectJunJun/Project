<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>

<head>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>준준치킨에 오신 것을 환영합니다</title>
    <link rel="icon" href="images/logo.PNG">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
    <style>
        body{
            font-family: 'IBM Plex Sans KR', sans-serif;
        }
        .error-content-container{
            position: absolute;
            top: 45%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .error-face{
            height: 200px;
            margin-bottom: 30px;
        }
        .error-content-heading{
            font-size: 30px;
            margin-bottom: 10px;
        }
        .btn-go-back-page{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="error-content-container">
    <img class="error-face" src="images/error_face.png">
    <div class="error-content-heading">Page not found.</div>
    <div><b>${title}</b></div>
    <div>${message}</div>
    <button class="btn-go-back-page" onclick="goBack()">이전 페이지로 돌아가기 → → → </button>
</div>

</body>
</html>
