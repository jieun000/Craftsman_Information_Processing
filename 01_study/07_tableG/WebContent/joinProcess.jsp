<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	String sql = "insert into member_tbl_06 values(?,?,?,?,?,?,?)";
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","fff","1234");
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		int result = pstmt.executeUpdate();
		if(result>0) {
%>
<script type="text/javascript">
	alert("회원 등록 성공");
	history.back();
</script>
<%
		} else {
%>
<script type="text/javascript">
	alert("회원 등록 실패");
	history.back();
</script>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
	
%>