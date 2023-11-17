<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JJC MENU</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

    <style>
        /* 수직 탭 스타일 */
        .ui-tabs-vertical {
            width: 100%;
        }
        .ui-tabs-vertical .ui-tabs-nav {
            padding: 10px 0;
            float: left;
            width: 20%;
        }
        .ui-tabs-vertical .ui-tabs-nav li {
            clear: left;
            width: 100%;
            padding : 25px 10px;
            border-bottom: 1px solid #ccc;
            font-size : 32px;
            font-weight: bold;
        }
        .ui-tabs-vertical .ui-tabs-nav li a {
            display: block;
        }
        .ui-tabs-vertical .ui-tabs-panel {
            float: right;
            width: 75%;
            min-height: 150px;
        }
        #basket {
            border-radius: 50px;
            background-color : #FF7B31;
            border : 3px solid #FF7B31;
            color: white;
            padding: 12px 16px;
            font-size: 32px;
            display: flex;
            color : #FFFFFF;
            cursor: pointer;
            margin-top: 20px;
        }
        .tab{
            display:flex;
            flex-wrap:wrap;
        }
        .menu_name{
            font-size: 25px;
            font-weight:bold;
        }
        .prcie{
            font-size: 20px;
            color: gray;
        }
        .
    </style>
</head>
<body>
<jsp:include page="Header.jsp"/>
<div id="tabs-vertical" class="ui-tabs-vertical ui-helper-clearfix">
    <ul>
        <li onclick="changeTab(0)"><a href="#tab-1-v">우리가게 별점 TOP3</a></li>
        <li onclick="changeTab(1)"><a href="#tab-2-v">치킨</a></li>
        <li onclick="changeTab(2)"><a href="#tab-3-v">사이드</a></li>
        <li onclick="changeTab(3)"><a href="#tab-4-v">음료</a></li>
    </ul>
    <div id="tab-1-v" class="tab">
        <c:forEach items="${top3list}" var="menu">
            <a href="detail.do?menu_id=${menu.menuId}">
                <img src="${menu.url}">
                <div class="menu_name">${menu.name}</div>
                <div class="price">${menu.price}원</div>
            </a>
        </c:forEach>
    </div>
    <div id="tab-2-v">
        <c:forEach items="${chickenlist}" var="menu">
            <a href="detail.do?menu_id=${menu.menuId}">
                <img src="${menu.url}">
                <div class="menu_name">${menu.name}</div>
                <div class="price">${menu.price}원</div>
            </a>
        </c:forEach>

    </div>
    <div id="tab-3-v">
        <c:forEach items="${sidelist}" var="menu">
            <a href="detail.do?menu_id=${menu.menuId}">
                <img src="${menu.url}">
                <div class="menu_name">${menu.name}</div>
                <div class="price">${menu.price}원</div>
            </a>
        </c:forEach>
    </div>
    <div id="tab-4-v">
        <c:forEach items="${beveragelist}" var="menu">
            <a href="detail.do?menu_id=${menu.menuId}">
                <img src="${menu.url}">
                <div class="menu_name">${menu.name}</div>
                <div class="price">${menu.price}원</div>
            </a>
        </c:forEach>

    </div>
</div>
<a href="BasketList.jsp"><button id ="basket"class="btn"><img src="./images/basket.png" width="50" height="50">  장바구니</button></a>
<script>
    // 세로(수직) 탭 초기화
    $(function() {
        $("#tabs-vertical").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
        $("#tabs-vertical li").removeClass("ui-corner-top").addClass("ui-corner-left");
    });

    function changeTab(index) {
        $("#tabs-vertical").tabs("option", "active", index);
    }
    // 동적으로 탭 추가
</script>
</body>
</html>