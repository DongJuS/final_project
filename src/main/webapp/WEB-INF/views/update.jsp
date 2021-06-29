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
<c:if test="${member == null}">
로그인을 해주세요
<form action="login" method="get">
<input type="submit" value="로그인">
</form>
</c:if>
<c:if test="${member!=null}">
<h1>업데이트</h1>
<form action="/UpdateProc" method="post">
<input type="text" name="id" value="${member.id}" readonly="readonly"><br/>
<input type ="text" name="pwd">
</br> <input type="email" name="email">
<input type="submit" value="수정하기">
</form>
</c:if>
</body>
</html>