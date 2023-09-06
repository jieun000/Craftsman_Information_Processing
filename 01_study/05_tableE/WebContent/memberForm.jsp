<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
 	try {
 		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","eee","1234");
		pstmt = con.prepareStatement("select * from member_tbl_04");
		rs = pstmt.executeQuery();
%>
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
	<h2>쇼핑몰 회원 목록</h2>
		<table border="1" style="margin: auto; text-align: center;">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>회원주소</td>
				<td>가입일자</td>
				<td>회원등급</td>
				<td>도시코드</td>
			</tr>
<%
	if(rs.next()) {
		do {
			String grade = "직원";
			if(rs.getString(6).equals("A")) grade = "VIP";
			if(rs.getString(6).equals("B")) grade = "일반";
%>
			<tr>
				<td><%=rs.getString(1) %></td>				
				<td><%=rs.getString(2) %></td>				
				<td><%=rs.getString(3) %></td>				
				<td><%=rs.getString(4) %></td>				
				<td><%=rs.getString(5).substring(0,10) %></td>				
				<td><%=grade %></td>				
				<td><%=rs.getString(7) %></td>				
			</tr>
			
<%
		} while(rs.next());
	}
%>
		</table>
	</section>
	<footer style="background: violet; color: white; 
				text-align: center; line-height: 100px;
				width: 100%; height: 100px; padding: 0; margin: 0">
		<p>
			HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
		</p>
	</footer>
</body>
<%
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
%>
</html>