<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 style="text-align: center;">회원 목록</h2>
	<table border="1" style="text-align: center; margin: auto;">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입입자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<c:forEach var="list" items="${lists}">
			<tr>
				<td></td>
			</tr>
		</c:forEach>
	</table>

</body>
<%@ include file="footer.jsp" %>
</html>