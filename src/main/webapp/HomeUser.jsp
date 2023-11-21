<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

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
            background-color: #ffffff;
        }
        .ui-tabs-vertical .ui-tabs-nav li {
            clear: left;
            width: 100%;
            margin-bottom: 10px;
            padding : 20px 5px;
            font-size : 24px;
            font-weight: bold;
            border-radius: 15px;
        }
        .ui-tabs-vertical .ui-tabs-nav li a {
            display: block;
        }
        .ui-tabs-vertical .ui-tabs-panel {
            float: right;
            width: 75%;
            min-height: 150px;
        }
        .ui-widget.ui-widget-content {
            border: 0;
        }
        .ui-widget-header {
            border: 0;
        }
        .ui-tabs .ui-tabs-nav li.ui-tabs-active {
            margin-bottom: 10px;
            padding-bottom: 20px;
            border: 0;
            border-bottom: 1px solid #cccccc;
        }
        .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
            border: 1px solid #FFFFFF;
            background-color : #ff9933;
        }
        .image {
            width: 240px;
            height: 200px;
            margin: 10px 0;
        }
        .menu_name{
            width: 240px;
            font-size: 24px;
            font-weight:bold;
            text-align: center;
        }
        .price{
            width: 240px;
            font-size: 18px;
            color: #888;
            text-align: center;
            margin-bottom: 20px;
        }
        a {
            color: white;
            display:flex;
            align-items:center;
            text-decoration: none;
        }
        .menulist{
            display: flex;
            flex-direction: column;
            width: 280px;
            float: left;
        }
        .menulist2 {
            display: flex;
            flex-direction: column;
            width: 220px;
            margin-top: 50px;
            float: left;
        }
        .image2 {
            width: 220px;
            height: 200px;
            margin: 10px 0;
        }
        .menu_name2{
            width: 220px;
            font-size: 24px;
            font-weight:bold;
            text-align: center;
        }
        .price2{
            width: 220px;
            font-size: 18px;
            color: #888;
            text-align: center;
            margin-bottom: 20px;
        }
        .icon {
            width: 40px;
            height: 40px;
            margin-right: 15px;
        }
        #basket {
            position: fixed;
            left: 20px;
            bottom: 20px;
            border: 0;
            border-radius: 30px;
            background-color : #ff9933;
            padding: 15px 30px;
            font-size: 28px;
            display: flex;
            color : #FFFFFF;
            cursor: pointer;
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <jsp:include page="Header.jsp"/>
    <div id="tabs-vertical" class="ui-tabs-vertical ui-helper-clearfix">
        <ul>
            <li onclick="changeTab(0)"><a href="#tab-1-v">우리가게 별점 TOP5</a></li>
            <li onclick="changeTab(1)"><a href="#tab-2-v">치킨</a></li>
            <li onclick="changeTab(2)"><a href="#tab-3-v">사이드</a></li>
            <li onclick="changeTab(3)"><a href="#tab-4-v">음료</a></li>
        </ul>
        <div id="tab-1-v" class="flex-box">
            <c:forEach items="${top3list}" var="menu">
                <div class="menulist2">
                    <a href="detail.do?menuId=${menu.menuId}">
                        <img src="${menu.url}" class="image2"></a>
                    <div>
                        <div class="menu_name2">${menu.name}</div>
                        <div class="price2">${menu.price}원</div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div id="tab-2-v" class="flex-box">
            <c:forEach items="${chickenlist}" var="menu">
                <div class="menulist">
                    <a href="detail.do?menuId=${menu.menuId}">
                        <img src="${menu.url}" class="image"></a>
                    <div>
                        <div class="menu_name">${menu.name}</div>
                        <div class="price">${menu.price}원</div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div id="tab-3-v">
            <c:forEach items="${sidelist}" var="menu">
                <div class="menulist">
                    <a href="detail.do?menuId=${menu.menuId}">
                        <img src="${menu.url}" class="image"></a>
                    <div>
                        <div class="menu_name">${menu.name}</div>
                        <div class="price">${menu.price}원</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="tab-4-v">
            <c:forEach items="${beveragelist}" var="menu">
                <div class="menulist">
                    <a href="detail.do?menuId=${menu.menuId}">
                        <img src="${menu.url}" class="image"></a>
                    <div>
                        <div class="menu_name">${menu.name}</div>
                        <div class="price">${menu.price}원</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <button id = "basket" class="btn">
        <a href="BasketList.do">
            <img src="./images/basket.png" class="icon">
        장바구니</a>
    </button>
<script>
    // 세로(수직) 탭 초기화

    $("#tabs-vertical").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
    $("#tabs-vertical li").removeClass("ui-corner-top").addClass("ui-corner-left");


    // 동적으로 탭 추가
    function changeTab(index) {
        $("#tabs-vertical").tabs("option", "active", index);
    }
</script>
</body>
</html>