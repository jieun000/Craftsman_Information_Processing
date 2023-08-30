<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	request.setCharacterEncoding("utf-8");
	String custno = request.getParameter("custno");
	String sql = "select * from member_tbl_03 where custno=?";
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","ddd","1234");
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custno);
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	* { margin: 0; padding: 0; }
</style>
<script type="text/javascript">
	function ckeckForm(f) {
		if(f.custname.value.trim="") {
			alert("회원성명 입력해");
			f.custname.focus();
			return false;
		}
		if(f.phone.value.trim="") {
			alert("전화번호 입력해");
			f.phone.focus();
			return false;
		}
		if(f.address.value.trim="") {
			alert("회원주소 입력해");
			f.address.focus();
			return false;
		}
		if(f.joindate.value.trim="") {
			alert("가입일자 입력해");
			f.joindate.focus();
			return false;
		}
		if(f.grade.value.trim="") {
			alert("고객등급 입력해");
			f.grade.focus();
			return false;
		}
		if(f.city.value.trim="") {
			alert("도시코드 입력해");
			f.city.focus();
			return false;
		}
	}

</script>
<title>Insert title here</title>
</head>
<body>
	<header style="background: blue; color: white; 
				text-align: center; line-height: 100px;
				width: 100%; height: 100px; padding: 0; margin: 0">
		<h1>쇼핑몰 회원관리 ver1.0</h1>
	</header>
	<nav style="background: skyblue; height: 50px; line-height: 50px;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="index.jsp">홈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="memberForm.jsp">회원 목록 조회/수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="saleForm.jsp">회원 매출 조회</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="joinForm.jsp">회원 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</nav>
	<section>
		<h2>쇼핑몰 회원 등록</h2>
		<form action="modProcess.jsp" method="get" onsubmit="return ckeckForm(this)">
			<table border="1" style="margin: auto; text-align: center;">
<%
		if(rs.next()) {
%>
				<tr>
					<td>회원 번호</td>
					<td><input type="text" name="custno" value="<%=rs.getString(1) %>" readonly /></td>
				</tr>
				<tr>
					<td>회원 성명</td>
					<td><input type="text" name="custname" value="<%=rs.getString(2) %>" /></td>
				</tr>
				<tr>
					<td>회원 전화</td>
					<td><input type="text" name="phone" value="<%=rs.getString(3) %>" /></td>
				</tr>
				<tr>
					<td>회원 주소</td>
					<td><input type="text" name="address" value="<%=rs.getString(4) %>" /></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value="<%=rs.getString(5).substring(0,10) %>" /></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td><input type="text" name="grade" value="<%=rs.getString(6) %>" /></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=rs.getString(7) %>" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정"/>
						<input type="button" value="조회" onclick="location.href='index.jsp'"/>
					</td>
				</tr>
<%
		}
%>
			</table>
		</form>
	</section>
	<footer style="background: blue; color: white; 
				text-align: center; line-height: 100px;
				width: 100%; height: 100px;">
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