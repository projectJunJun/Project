<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<a href="HomeAdmin.jsp">
    <img src="images/junjunlogo.png">
</a>
<c:if test="${!empty account}">
    <div>
        ${account.userId} 님 로그인 되었습니다. <a href="logout.do">로그아웃</a>
    </div>
</c:if>