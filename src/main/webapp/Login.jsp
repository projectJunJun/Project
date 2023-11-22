<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<html>
<head>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>준준치킨에 오신 것을 환영합니다</title>
    <link rel="icon" href="images/logo.PNG">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body{
            font-family: 'IBM Plex Sans KR', sans-serif;
        }
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>JJC login</title>
    <script>
        function Login(){
            if(document.loginField.userId.value == ""){
                alert("PLEASE INPUT ID")
                document.loginField.userId.focus();
            }
            else if (document.loginField.password.value == ""){
                alert("PLEASE INPUT PASSWORD");
                document.loginField.password.focus();
            }
            else{
                document.loginField.submit();
            }
        }
    </script>
	
	<script>
		$(document).ready(function() {			
	        let message = "${message}";
	        if (message != ""){
	        	alert(message);
	        } else {
	        	
	        }	        
	    });
	</script>
    
    <style>
        html {
            height: 100%;
        }
        body {
            height: 100%;
            margin: 0;
            display: grid;
            justify-items: center;
            align-items: center;
            background-color: #ff9933;
        }
        #main-holder {
            width: 50%;
            height: 70%;
            display: grid;
            justify-items: center;
            align-items: center;
            background-color: white;
            border-radius: 7px;
            box-shadow: 0px 0px 5px 2px black;
        }

        #login-form {
            align-self: flex-start;
            display: grid;
            justify-items: center;
            align-items: center;
        }

        .login-form-field::placeholder {
            color: #ff9933;
        }

        .login-form-field {
            width: 100%;
            border: none;
            border-bottom: 1px solid #ff9933;
            margin-bottom: 10px;
            border-radius: 3px;
            outline: none;
            padding: 0px 0px 5px 5px;
        }

        #login-form-submit {
            width: 100%;
            padding: 7px;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            background-color: #3a3a3a;
            cursor: pointer;
            outline: none;
        }
    </style>
</head>
<body>
    <main id="main-holder">
        <div id="login-header">
            <img src="images/junjunlogo.png">
        </div>

        <form id="login-form" name="loginField" method="post" action="login.do">
            <input type="text" name="userId" id="userId" class="login-form-field" placeholder="Username" required>
            <input type="password" name="password" id="password" class="login-form-field" placeholder="Password" required>
            <input type="submit" value="Login" id="login-form-submit">
        </form>
    </main>
</body>
</html>
