<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="update.do">
		<input style="display: none" type="text" name="no" value="${detail.no}"><br>
		<input type="text" name="name" value="${detail.name}"><br>
		<input type="text" name="age" value="${detail.age}">
		
		<input type="submit" value="수정">
		<button onclick="location.href='delete.do?no=${detail.no}'">삭제</button>
	</form>
</body>
</html>