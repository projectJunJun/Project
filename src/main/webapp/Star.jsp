<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>후기를 남겨주세요</title>
    <style>
        @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
        .rate { display: inline-block;border: 0;margin-right: 15px;}
        .rate > input {display: none;}
        .rate > label {float: right;color: #ddd;}
        .rate > label:before {display: inline-block;font-size: 2rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
        .rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
        .rate input:checked ~ label,
        .rate label:hover,.rate label:hover ~ label { color: #dd7711 !important;  }
        .rate input:checked + .rate label:hover,
        .rate input input:checked ~ label:hover,
        .rate input:checked ~ .rate label:hover ~ label,
        .rate label:hover ~ input:checked ~ label { color: #dd7711 !important;  }
    </style>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
    <script>
        $(function() {
            setInterval(() => {
                location.href = 'HomeUser.jsp'
                $.post('pay.do')
            }, 9999999999)
        })
    </script>
</head>
<body>
    <p>다음 손님을 위해 60초 후 창이 닫힙니다</p>
    <h1>오늘 식사는 괜찮으셨나요?</h1>
    <h2>더 나은 서비스를 위해 메뉴 평점을 작성해주세요 :D</h2>
    <h3>오늘 주문한 메뉴 목록</h3>
    <form action="/pay.do" method="post">
        <table>
            <thead>
                <tr>
                    <td>메뉴</td>
                    <td>별점</td>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="order">
                <tr>
                    <td>${order.menu.name}</td>
                    <td>
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
                        </fieldset>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <input type="submit" value="별점 작성 완료">
    </form>
</body>
</html>
