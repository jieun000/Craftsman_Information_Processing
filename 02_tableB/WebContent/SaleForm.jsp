<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%
	String sql="select m1.custno, custname, grade, sum(price)"
	+" from member_tbl_01 m1 inner join money_tbl_01 m2"
	+" on m1.custno=m2.custno"
	+" group by m1.custno, m1.custname, m1.grade order by sum(price) desc";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","aaaaa","1234");
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
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
	<h1>쇼핑몰 회원관리</h1>
</header>
<nav style="background-color: skyblue; height: 50px; line-height: 50px">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="joinForm.jsp">회원등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="memberForm.jsp">회원목록조회/수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="SaleForm.jsp">회원매출조회</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="index.jsp">홈으로</a>
</nav>
<section>
	<h2 style="text-align: center;">회원매출조회</h2>
	<table border="1" style="margin: auto; text-align: center;">
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>고객등급</td>
			<td>매출</td>
		</tr>
<%
	if(rs.next()) {
		do {
			String grade = "직원";
			if(rs.getString(3).equals("A")) grade = "VIP";
			else if(rs.getString(3).equals("B")) grade = "일반";
%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=grade %></td>
			<td><%=rs.getString(4) %></td>
		</tr>
<%
		} while(rs.next());
		} else {
	}
%>
	</table>
</section>
<footer>
	<p>
		HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea 
	</p>
</footer>
<%
	} catch(Exception e) {
	} finally {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
%>
</body>
</html>