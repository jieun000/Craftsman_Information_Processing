<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","bbb","1234");
		pstmt = con.prepareStatement("select * from memberTbl_02");
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* { margin: 0; padding: 0 }
nav > a { text-decoration: none; color: white; }
nav > a:hover { color: lightgray; }
</style>
</head>
<body>
	<header style="background: skyblue; color: white; text-align: center; width: 100%; padding: 2%;">
		<h2>쇼핑몰 회원관리 ver1.0</h2>
	</header>
	<nav style="background: gray; width: 100%; padding: 1.5%;">
		<a href="index.jsp">홈으로</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="memberForm.jsp">회원 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="joinForm.jsp">회원 등록</a>
	</nav>
	<section>
		<h2 style="text-align: center; margin: 30px;">쇼핑몰 회원 목록</h2>
		<table border="1" style="text-align: center; margin: auto;">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>회원주소</th>
				<th>가입일자</th>
				<th>회원등급</th>
				<th>도시코드</th>
			</tr>
<%
		if(rs.next()) {
			do {
				String grade = "일반";
				if(rs.getString(6).equals("A")) grade = "VIP";
				else if(rs.getString(6).equals("B")) grade = "일반";
%>
			<tr>
				<td><a href="modForm.jsp?custno=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
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
	} catch(Exception e) {
	e.printStackTrace();
	} finally {
	if(rs!=null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(con!=null) con.close();
		}
%>
		</table>
	</section>
	<footer style="background: skyblue; color: white; text-align: center; width: 100%; padding: 2%;">
		<p>
			HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
		</p>
	</footer>
</body>
</html>