<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
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
        #login-error-msg-holder{
            width: 100%;
            height: 50%;
            display: grid;
            justify-items: center;
            align-items: center;
        }
        #login-error-msg {
            width: 23%;
            text-align: center;
            margin: 0;
            padding: 5px;
            font-size: 12px;
            font-weight: bold;
            color: #ff9933;
            border: 1px solid #ff9933;
            background-color: #e58f8f;
            opacity: 0;
        }

        #error-msg-second-line {
            display: block;
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
        <h1 id="login-header">JJC LOGIN</h1>
        <div id="login-error-msg-holder">
            <p id="login-error-msg">WRONG ID <span id="error-msg-second-line">PASSWORD</span></p>
        </div>

        <form id="login-form" name="loginField" method="post" action="login.do">
            <input type="text" name="userId" id="userId" class="login-form-field" placeholder="Username">
            <input type="password" name="password" id="password" class="login-form-field" placeholder="Password">
            <input type="submit" value="Login" id="login-form-submit">
        </form>
    </main>
</body>
</html>
