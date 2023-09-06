<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select a.artist_id, a.artist_name, a.artist_gender, sum(b.point), avg(b.point), row_number() over(order by sum(b.point) desc) from tbl_artist a inner join tbl_audition b on a.artist_id = b.artist_id group by a.artist_id, a.artist_name, a.artist_gender order by sum(b.point) desc";
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
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
		<h3 style="text-align: center; margin: 20px;">오디션 결과</h3>
			<table border="1" style="margin: auto; text-align: center;">
				<tr>
					<th>참가번호</th>
					<th>참가자이름</th>
					<th>참가자성별</th>
					<th>점수합계</th>
					<th>평균점수</th>
					<th>순위</th>
				</tr>
<%
	if(rs.next()) {
		do {
			String gender = "남";
			if(rs.getString(3).equals("F")) gender = "여";
%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=gender %></td>
					<td><%=rs.getDouble(4) %></td>
					<td><%=rs.getDouble(5) %></td>
					<td><%=rs.getInt(6) %></td>
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
	<footer style="background: gray; color: white; width: 100%; text-align: center; padding: 1.5%; position: absolute; bottom: 0;">
		<p>
			HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
		</p>
	</footer>
</body>
</html>