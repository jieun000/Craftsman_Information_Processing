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
		pstmt = con.prepareStatement("select max(custno) from member_tbl_04");
		rs = pstmt.executeQuery();
	 	int custno = 10001;
		if(rs.next()) {
			custno = rs.getInt(1)+1;
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* { margin: 0; padding: 0; }
</style>
<script type="text/javascript">
	function checkForm(f) {
		if(f.custname.value.trim="") {
			alert("회원성명 잊었어");
			f.custname.focus();
			return false;
		}
	}
</script>
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
		<form action="joinProcess.jsp" onsubmit="return ckeckForm(this)">
			<table border="1" style="margin: auto; text-align: center;">
				<tr>
					<td>회원번호(자동생성)</td>
					<td><input type="text" name="custno" value="<%=custno%>"/></td>				
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" /></td>				
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" /></td>				
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" /></td>				
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" /></td>				
				</tr>
				<tr>
					<td>회원등급 [A:VIP, B:일반, C:직원]</td>
					<td><input type="text" name="grade" /></td>				
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" /></td>				
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" />
						<input type="button" value="조회" onclick="location.href='memberForm.jsp'" />
					</td>		
				</tr>
			</table>
		</form>
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