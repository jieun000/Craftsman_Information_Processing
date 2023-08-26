<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header {
		background-color: blue;
		width: 100%;
		text-align: center;
		color: white;
		line-height: 100px;
		height: 100px;
		padding: 0;
		margin: 0;
	}
	footer {
		background-color: blue;
		text-align: center;
		color: white;
		height: 100px;
		line-height: 100px;
		bottom: 0;
	}
</style>
</head>
<body>
<header>
	<h1>쇼핑몰 회원관리 ver1.0</h1>
</header>
<nav style="background-color: skyblue; height: 50px; line-height: 50px">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="joinForm.jsp">회원등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="memberForm.jsp">회원목록조회/수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="SaleForm">회원매출조회</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="index.jsp">홈으로</a>
</nav>
<section>
	<h2 style="text-align: center;">홈쇼핑 회원 정보 수정</h2>
	<form name="f" action="modProcess">
		<table>
			<tr>
				<td>회원번호(자동생성)</td>
				<td>번호</td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td>번호</td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td>번호</td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td>번호</td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td>번호</td>
			</tr>
			<tr>
				<td>고객등급[A:VIP B:일반, C:직원]</td>
				<td>번호</td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td>번호</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="수정" />
					<input type="button" value="조회" onclick="location.href='memberForm.jsp'" />
				</td>
			</tr>
		</table>
	</form>
</section>
</body>
</html>