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
	<form method="post" action="add.do">
		이름: <input type="text" name="name"> <br>
		나이: <input type="text" name="age"> <br>
	
		<input type="submit" value="추가">
	</form>
</body>
</html>