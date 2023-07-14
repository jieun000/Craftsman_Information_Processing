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
		<h2 style="text-align: center;">멤버 페이지</h2>
		<form method="post" action="update.do">
			<table style="border: 1px solid black; text-align: center; margin: auto;">
				<tr style="display: none">
					<td>
						<label for="custname">회원번호</label>
						<input type="text" name="custno" value="${detail.custno}">
					</td>	
				</tr>
				<tr>
					<td>
						<label for="custname">회원성명</label>
						<input type="text" name="custname" value="${detail.custname}">
					</td>
				</tr>
				<tr>
					<td>
						<label for="phone">전화번호</label>
						<input type="text" name="phone" value="${detail.phone}">
					</td>
				</tr>
				<tr>
					<td>
						<label for="address">주소</label>
						<input type="text" name="address" value="${detail.address}">
					</td>
				</tr>
				<tr>
					<td>
						<label for="joindate">가입일자</label>
						<input type="text" name="joindate" value="${detail.joindate}">
					</td>
				</tr>
				<tr>
					<td>
						<label for="grade">고객등급</label>
						<input type="text" name="grade" value="${detail.grade}">
					</td>
				</tr>
				<tr>
					<td>
						<label for="city">거주지역</label>
						<input type="text" name="city" value="${detail.city}"></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="수정">
						<input type="button" value="목록" onclick="location.href='list.do'">
						<input type="button" value="삭제" onclick="location.href='delete.do?custno=${detail.custno}'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>