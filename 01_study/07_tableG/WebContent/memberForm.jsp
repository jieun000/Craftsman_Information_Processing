<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","fff","1234");
		pstmt = con.prepareStatement("select * from member_tbl_06");
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* { margin: 0; padding: 0; }
	a { text-decoration: none; color: white; }
</style>
</head>
<body>
	<header>
		<h1 style="background: skyblue; color: white;
					text-align: center; width: 100%; padding: 2%;">
		쇼핑몰 회원관리 ver1.0</h1>
	</header>
	<nav style="background: gray; width: 100%;padding: 10px;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="index.jsp">홈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="joinForm.jsp">회원 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="memberForm.jsp">회원 목록 조회/수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</nav>
	<section>
		<h2 style="text-align: center; margin: 30px;">쇼핑몰 회원 목록</h2>
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
				else if(rs.getString(6).equals("B")) grade = "일반";
%>
			<tr>
				<td><a style="color: violet;" href="modForm.jsp?custno=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
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
	
	<footer style="background: skyblue; color: white;
					text-align: center; width: 100%; padding: 2%;">
		<p>
			HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
		</p>
	</footer>
</body>

</html>