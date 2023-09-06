<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* { margin: 0; padding: 0; }
nav > a { text-decoration: none; color: white; padding: 1%;}
nav > a:hover { background: gray; }
</style>
</head>
<body>
	<header style="background: gray; color: white; text-align: center; width: 100%; padding: 1.5%;">
		<h3>오디션 프로그램</h3>
	</header>
	<nav style="background: lightgray; width: 100%; padding: 1% 0;">
		<a href="main.jsp">홈으로</a>
		<a href="joinForm.jsp">오디션 참가등록</a>
		<a href="result.jsp">오디션 결과</a>
	</nav>
	<section>
		<h3 style="text-align: center; margin: 20px;">오디션 관리 프로그램</h3>
		<h4>&nbsp;&nbsp;프로그램 작성 순서</h4>
		<span>&nbsp;1. tbl_audition 테이블을 생성한다.</span> <br>
		<span>&nbsp;2. tbl_artist 테이블을 생성한다.</span> <br>
		<span>&nbsp;3. tbl_audition, tbl_artist 테이블에 서시된 문제지의 참조데이터를 추가생성한다.</span> <br>
		<span>&nbsp;4. tbl_artist 입력 화면 프로그램을 작성한다.</span> <br>
		<span>&nbsp;5. 결과 조회 프로그램을 작성한다.</span>
	</section>
	<footer style="background: gray; color: white; width: 100%; text-align: center; padding: 1.5%; position: absolute; bottom: 0;">
		<p>
			HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
		</p>
	</footer>
</body>
</html>