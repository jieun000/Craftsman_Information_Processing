<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","bbb","1234");
		pstmt = con.prepareStatement("select * from memberTbl_02 where custno=?");
		pstmt.setString(1, request.getParameter("custno"));
		rs = pstmt.executeQuery();
		if(rs.next()) {
		}
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
<script type="text/javascript">
	function checkForm(f) {
		if(f.custname.value.trim()=="") {
			alert("이름 입력해");
			f.custname.focus();
			return false;
		}
	}
</script>
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
		<form action="modProcess.jsp" onsubmit="return checkForm(this)">
			<table border="1" style="margin: auto;">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="custno" value=<%=rs.getString(1) %> /></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value=<%=rs.getString(2)%> /></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" value=<%=rs.getString(3)%> /></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value=<%=rs.getString(4)%> /></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value=<%=rs.getString(5).substring(0,10) %> /></td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td><input type="text" name="grade" value=<%=rs.getString(6)%> /></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value=<%=rs.getString(7)%> /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="등록" />
						<input type="button" value="조회" onclick="location.href='memberForm.jsp'" />
					</td>
				</tr>
<%
	} catch(Exception e) {
		
	} finally {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
%>
			</table>
		</form>
	</section>
	<footer style="background: skyblue; color: white; text-align: center; width: 100%; padding: 2%;">
		<p>
			HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
		</p>
	</footer>
</body>
</html>