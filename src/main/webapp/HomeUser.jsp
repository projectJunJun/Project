<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>준준치킨에 오신 것을 환영합니다</title>
    <link rel="icon" href="images/logo.PNG">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <style>
        body{
            font-family: 'IBM Plex Sans KR', sans-serif;
        }
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
            font-family: 'IBM Plex Sans KR', sans-serif;
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
            font-family: 'IBM Plex Sans KR', sans-serif;
            font-size: 24px;
            font-weight:bold;
            text-align: center;
        }
        .price{
            width: 240px;
            font-family: 'IBM Plex Sans KR', sans-serif;
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
        .icon {
            width: 40px;
            height: 40px;
            margin-right: 15px;
            font-size: 40px;
            color: #FFFFFF;
        }
        .button {
            position: fixed;
            bottom: 20px;
            border: 0;
            border-radius: 30px;
            background-color : #ff9933;
            padding: 15px 30px;
            font-size: 24px;
            display: flex;
            color : #FFFFFF;
            cursor: pointer;
            margin-top: 20px;
            font-weight: bold;
        }
        #basket {
            left: 20px;
            bottom: 100px;
        }
        #pay {
            left: 20px;
            bottom: 20px;
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
                <div class="menulist">
                    <a href="detail.do?menuId=${menu.menuId}">
                        <img src="${menu.url}" class="image"></a>
                    <div>
                        <div class="menu_name">${menu.name}</div>
                        <div class="price"><fmt:formatNumber value="${menu.price}" pattern="#,###" />원</div>
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
                        <div class="price"><fmt:formatNumber value="${menu.price}" pattern="#,###" />원</div>
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
                        <div class="price"><fmt:formatNumber value="${menu.price}" pattern="#,###" />원</div>
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
                        <div class="price"><fmt:formatNumber value="${menu.price}" pattern="#,###" />원</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <button id="basket" class="button">
        <a href="BasketList.do">
            <img src="./images/basket.png" class="icon">
        장바구니</a>
    </button>
    <button id="pay" class="button">
        <a href="Pay.jsp">
            <img src="./images/card.png" class="icon">
            결제하기</a>
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