<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                location.href = 'HomeAdmin.jsp'
                $.post('pay.do')
            }, 3000)
        })
    </script>
</head>
<body>
    <p>다음 손님을 위해 60초 후 창이 닫힙니다</p>
    <h1>오늘 식사는 괜찮으셨나요?</h1>
    <h2>더 나은 서비스를 위해 메뉴 평점을 작성해주세요 :D</h2>
    <h3>오늘 주문한 메뉴 목록</h3>
    <main>
        <%-- TODO: 메뉴별 별점 받기 --%>
        <div>
            <span>후라이드/양념 반반</span>
            <fieldset class="rate">
                <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5"></label>
                <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5"></label>
                <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4"></label>
                <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5"></label>
                <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3"></label>
                <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5"></label>
                <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2"></label>
                <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5"></label>
                <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1"></label>
                <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5"></label>
            </fieldset>
        </div>
    </main>
</body>
</html>
