<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("utf-8");
	String custno = request.getParameter("custno");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521/xe","aaaaa","1234");
		pstmt = con.prepareStatement("select * from member_tbl_01 where custno=?");
		pstmt.setString(1, custno);
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
<script>
	function ckeckForm(f) {
		if(f.custname.value.trim()=="") {
			alert("회원성명이 입력되지 않았습니다.");
			f.custname.focus();
			return false;
		}
		if(f.phone.value.trim()=="") {
			alert("회원전화번호가 입력되지 않았습니다.");
			f.phone.focus();
			return false;
		}
		if(f.address.value.trim()=="") {
			alert("회원주소가 입력되지 않았습니다.");
			f.address.value.focus();
			return false;
		}
		if(f.joinDate.value.trim()=="") {
			alert("가입일자가 입력되지 않았습니다.");
			f.joinDate.value.focus();
			return false;
		}
		if(f.grade.value.trim()=="") {
			alert("고객등급가 입력되지 않았습니다.");
			f.grade.value.focus();
			return false;
		}
		if(f.city.value.trim()=="") {
			alert("도시코드가 입력되지 않았습니다.");
			f.city.value.focus();
			return false;
		}
	}
</script>
</head>
<body>
<header>
	<h1>쇼핑몰 회원관리 ver1.0</h1>
</header>
<nav style="background-color: skyblue; height: 50px; line-height: 50px">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="joinForm.jsp">회원등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="memberForm.jsp">회원목록조회/수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="SaleForm">회원매출조회</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="index.jsp">홈으로</a>
</nav>
<section>
	<h2 style="text-align: center;">홈쇼핑 회원 정보 수정</h2>
	<form name="f" action="modProcess.jsp" onsubmit="return ckeckForm(this)">
		<table border="1" style="margin: auto; text-align: center;">
<%
	if(rs.next()) {
%>
			<tr>
				<td>회원번호(자동생성)</td>
				<td><input type="text" name="custno" value="<%=rs.getString(1) %>" readonly /></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname" value="<%=rs.getString(2) %>" /></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone" value="<%=rs.getString(3) %>" /></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address" value="<%=rs.getString(4) %>" /></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joinDate" value="<%=rs.getString(5).substring(0,10) %>" /></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP B:일반, C:직원]</td>
				<td><input type="text" name="grade" value="<%=rs.getString(6) %>" /></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" value="<%=rs.getString(7) %>" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="수정" />
					<input type="button" value="조회" onclick="location.href='memberForm.jsp'" />
				</td>
			</tr>
<%
	}
%>
		</table>
	</form>
</section>
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