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
	<div style="height: 300px">
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
				<td><a href="update.do?custno=${list.custno}" style="color: green;">${list.custno}</a></td>
				<td>${list.custname}</td>
				<td>${list.phone}</td>
				<td>${list.address}</td>
				<td>${list.joindate}</td>
				<td>${list.grade}</td>
				<td>${list.city}</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>