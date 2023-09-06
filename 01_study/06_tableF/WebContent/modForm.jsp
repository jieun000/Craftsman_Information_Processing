<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	String sql ="select * from member_tbl_05 where custno=?";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","ee","1234");
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("custno"));
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
<script type="text/javascript">
	function ckeckForm(f) {
		if(f.custname.value.trim="") {
			alert("이름 체크");
			f.custname.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<header>
		<h1 style="background: skyblue; color: white;
					text-align: center; width: 100%; padding: 2%;">
		쇼핑몰 회원관리 ver1.0</h1>
	</header>
	<nav style="background: gray; padding: 10px; width: 100%;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="index.jsp">홈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="joinForm.jsp">회원 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="memberForm.jsp">회원 목록 조회/수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</nav>
	<section>
		<h2 style="text-align: center; margin: 30px;">쇼핑몰 회원 등록</h2>
		<form action="modProcess.jsp" onsubmit="return checkForm(this)">
			<table border="1" style="margin: auto; text-align: center;;">
<%
	if(rs.next()) {
%>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" value="<%=rs.getString(1) %>" readonly /></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%=rs.getString(2) %>" /></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" value="<%=rs.getString(3) %>" /></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" value="<%=rs.getString(4) %>" /></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value="<%=rs.getString(5).substring(0,10) %>" /></td>
				</tr>
				<tr>
					<td>회원등급</td>
					<td><input type="text" name="grade" value="<%=rs.getString(6) %>" /></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=rs.getString(7) %>" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" />
						<input type="button" value="조회" onclick="location.href='index.jsp'" />
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer style="background: skyblue; color: white;
					text-align: center; width: 100%; padding: 2%;">
		<p>
			HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
		</p>
	</footer>
<%
	}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
%>
</body>
</html>