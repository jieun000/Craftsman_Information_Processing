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
	<div class="container">
		<h2 >멤버 등록 페이지</h2>
		<form method="post" action="add.do">
			<table style="border: 1px solid black; text-align: center; margin: auto;">
				<tr>
					<td>
						<label for="custname">회원성명</label>
						<input type="text" name="custname">
					</td>
				</tr>
				<tr>
					<td>
						<label for="phone">전화번호</label>
						<input type="text" name="phone">
					</td>
				</tr>
				<tr>
					<td>
						<label for="address">주소</label>
						<input type="text" name="address">
					</td>
				</tr>
				<tr>
					<td>
						<label for="joindate">가입일자</label>
						<input type="text" name="joindate">
					</td>
				</tr>
				<tr>
					<td>
						<label for="grade">고객등급</label>
						<input type="text" name="grade">
					</td>
				</tr>
				<tr>
					<td>
						<label for="city">거주지역</label>
						<input type="text" name="city"></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="등록">
						<input type="button" value="목록" onclick="location.href='list.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>