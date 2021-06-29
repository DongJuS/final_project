<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${member == null }">
로그인을 해주세요
<form action="login" method="get">
<input type="submit" value="로그인">
</form>
</c:if>
<c:if test="${member != null }">
${member.id} 님 안녕하세요
<form action="logout" method="post">
<input type="submit" value="로그아웃">
</form>
</c:if>

</body>
</html>