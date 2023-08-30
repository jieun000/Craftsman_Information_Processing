<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* { margin: 0; padding: 0; }
</style>
</head>
<body>
	<header style="background: violet; color: white; 
			text-align: center; line-height: 100px;
			width: 100%; height: 100px; padding: 0; margin: 0">
	<h1>쇼핑몰 회원관리 ver1.0</h1>
	</header>
	<nav style="background: lightgray; height: 50px; line-height: 50px;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="index.jsp">홈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="memberForm.jsp">회원 목록 조회/수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="saleForm.jsp">회원 매출 조회</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="joinForm.jsp">회원 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</nav>
	<section>
	<h2>쇼핑몰 회원 관리 프로그램</h2>
	<pre>
		쇼핑몰 회원정보의 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.
		프로그램 작성 순서
		1. 회원정보 테이블을 생성한다.
		2. 매출정보 테이블을 생성한다.
		3. 회원정보, 매출정보 테이블에 서시된 문제지의 참조데이터를 추가생성한다.
		4. 회원정보 입력 화면 프로그램을 작성한다.
		5. 회원정보 조회 프로그램을 작성한다.
		6. 회원매출정보 조회 프로그램을 작성하다.
	</pre>
	</section>
	<footer style="background: violet; color: white; 
				text-align: center; line-height: 100px;
				width: 100%; height: 100px; padding: 0; margin: 0">
		<p>
			HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
		</p>
	</footer>
</body>
</html>