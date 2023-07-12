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
	<div>
	<h2 style="text-align: center;">멤버 등록 페이지</h2>
	<form method="post" action="add.do">
		<table style="border: 1px solid black; text-align: center; margin: auto;">
			<tr>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td><input type="text" name="joindate"></td>
			</tr>
			<tr>
				<td><input type="text" name="grade"></td>
				</tr>
			<tr>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='list.do'">
				</td>
			</tr>
		</table>
		
		<div>
		</div>
		
	</form>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>