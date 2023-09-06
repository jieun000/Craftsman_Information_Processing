<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String sql = "insert into member_tbl_04 values(?,?,?,?,?,?,?)";
	Connection con = null;
	PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","eee","1234");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("custno"));
			pstmt.setString(2, request.getParameter("custname"));
			pstmt.setString(3, request.getParameter("phone"));
			pstmt.setString(4, request.getParameter("address"));
			pstmt.setString(5, request.getParameter("joindate"));
			pstmt.setString(6, request.getParameter("grade"));
			pstmt.setString(7, request.getParameter("city"));
			int result = pstmt.executeUpdate();
			if(result>0) {
%>
<script>
			alert("회원 등록 성공");
			history.back();
</script>
<%
			} else {
%>
<script>
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