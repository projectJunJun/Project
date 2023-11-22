<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>후기를 남겨주세요</title>
    <style>
        @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
        .rate { display: inline-block;border: 0;margin: 0;}
        .rate > input {display: none;}
        .rate > label {float: right;color: #ddd;}
        .rate > label:before {display: inline-block;font-size: 2rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
        .rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
        .rate input:checked ~ label,
        .rate label:hover,.rate label:hover ~ label { color: #ff9933 !important;  }
        .rate input:checked + .rate label:hover,
        .rate input input:checked ~ label:hover,
        .rate input:checked ~ .rate label:hover ~ label,
        .rate label:hover ~ input:checked ~ label { color: #ff9933 !important;  }
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        nav {
            overflow: hidden;
            position: relative;
            width: 100%;
        }
        p {
            animation: bannerMove 15s linear infinite;
            color: #aaaaaa;
            white-space: nowrap;
        }
        @keyframes bannerMove {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(90%);
            }
        }
        h1, h2 {
            text-align: center;
            margin-bottom: 0px;
        }
        h3 {
            width: 190px;
            text-align: center;
            border: 2px solid #ff9933;
            border-radius: 15px;
            padding: 12px 30px;
            margin-top: 100px;
        }
        main {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        th {
            font-size: 18px;
            height: 50px;
        }
        .left {
            width: 300px;
        }
        .right {
            width: 205px;
        }
        input {
            width: 500px;
            height: 50px;
            margin-top: 10px;
            border: 0;
            border-radius: 5px;
            background-color: #ff9933;
            color: #FFFFFF;
            font-size: 18px;
            font-weight: bold;
        }
        input:hover {
            background-color: #ff8833;
            cursor: pointer;
        }
    </style>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
    <script>
        $(function() {
            const second = document.querySelector('#second')
            const form = document.querySelector('form')
            let time = 60
            setInterval(() => {
                time -= 1
                second.innerText = time
            }, 1000)
            setInterval(() => {
                localStorage.clear()
                form.submit()
            }, 10000)
        })
        $(document).on('click', 'input[type="submit"]', function() {
            localStorage.clear();
            $.post('pay.do');
            location.href = 'selectMenuByCategory.do';
        });
    </script>
</head>
<body>
    <nav>
        <p>다음 손님을 위해 <span id="second">60</span>초 후 창이 닫힙니다</p>
    </nav>
    <h1>오늘 식사는 괜찮으셨나요?</h1>
    <h2>더 나은 서비스를 위해 메뉴 평점을 작성해주세요 :D</h2>
    <h3>오늘 주문한 메뉴 목록</h3>
    <main>
        <form action="/pay.do" method="post">
            <table>
<%--                <thead>--%>
<%--                    <tr>--%>
<%--                        <th class="left">메뉴</th>--%>
<%--                        <th class="right">별점</th>--%>
<%--                    </tr>--%>
<%--                </thead>--%>
                <tbody>
                <c:forEach items="${list}" var="order">
                    <tr>
                        <td class="left">${order.menu.name}</td>
                        <td class="right">
                            <fieldset class="rate">
                                <input type="hidden" name="menuId_${order.menuId}" value="${order.menuId}">
                                <input type="radio" id="rating10_${order.menuId}" name="rating_${order.menuId}" value="5"><label for="rating10_${order.menuId}" title="5"></label>
                                <input type="radio" id="rating9_${order.menuId}" name="rating_${order.menuId}" value="4.5"><label class="half" for="rating9_${order.menuId}" title="4.5"></label>
                                <input type="radio" id="rating8_${order.menuId}" name="rating_${order.menuId}" value="4"><label for="rating8_${order.menuId}" title="4"></label>
                                <input type="radio" id="rating7_${order.menuId}" name="rating_${order.menuId}" value="3.5"><label class="half" for="rating7_${order.menuId}" title="3.5"></label>
                                <input type="radio" id="rating6_${order.menuId}" name="rating_${order.menuId}" value="3"><label for="rating6_${order.menuId}" title="3"></label>
                                <input type="radio" id="rating5_${order.menuId}" name="rating_${order.menuId}" value="2.5"><label class="half" for="rating5_${order.menuId}" title="2.5"></label>
                                <input type="radio" id="rating4_${order.menuId}" name="rating_${order.menuId}" value="2"><label for="rating4_${order.menuId}" title="2"></label>
                                <input type="radio" id="rating3_${order.menuId}" name="rating_${order.menuId}" value="1.5"><label class="half" for="rating3_${order.menuId}" title="1.5"></label>
                                <input type="radio" id="rating2_${order.menuId}" name="rating_${order.menuId}" value="1"><label for="rating2_${order.menuId}" title="1"></label>
                                <input type="radio" id="rating1_${order.menuId}" name="rating_${order.menuId}" value="0.5"><label class="half" for="rating1_${order.menuId}" title="0.5"></label>
                                <input type="radio" id="rating0_${order.menuId}" name="rating_${order.menuId}" value="0" checked />
                            </fieldset>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <input type="submit" value="별점 작성 완료하기">
        </form>
    </main>
</body>
</html>
