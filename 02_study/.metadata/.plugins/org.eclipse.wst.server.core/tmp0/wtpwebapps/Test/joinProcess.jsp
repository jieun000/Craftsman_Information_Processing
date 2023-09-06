<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
		pstmt = con.prepareStatement("insert into tbl_artist values(?,?,?,?,?)");
		pstmt.setString(1, request.getParameter("artist_id"));
		pstmt.setString(2, request.getParameter("artist_name"));
		pstmt.setString(3, request.getParameter("artist_gender"));
		pstmt.setString(4, request.getParameter("talent"));
		pstmt.setString(5, request.getParameter("agency"));
		int result = pstmt.executeUpdate();
		if(result>0) {
%>
<script type="text/javascript">
		alert("등록 성공");
		location.href="result.jsp";
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