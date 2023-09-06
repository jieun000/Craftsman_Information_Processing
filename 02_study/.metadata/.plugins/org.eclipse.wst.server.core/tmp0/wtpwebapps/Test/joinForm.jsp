<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function submitBtn(f) {
		if(f.artist_id.value=="") {
			alert("번호칸이 비었습니다.");
			f.artist_id.focus();
			return false;
		}
		if(f.artist_name.value=="") {
			alert("이름칸이 비었습니다.");
			f.artist_name.focus();
			return false;
		}
		if(f.artist_gender.value=="성별") {
			alert("성별칸이 선택되지 않았습니다.");
			f.artist_gender.focus();
			return false;
		}
		if(f.talent.value=="특기") {
			alert("특기칸이 선택되지 않았습니다.");
			f.talent.focus();
			return false;
		}
		if(f.agency.value=="") {
			alert("소속사칸이 비었습니다.");
			f.agency.focus();
			return false;
		}
	}
	function resetBtn(f) {
		if(confirm("작성한 내용이 전부 삭제됩니다. 정말로 다시쓰시겠습니까?")) { 
			f.artist_id.focus();
			return true; 
		}
		else { return false; }
	}
</script>
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
		<h3 style="text-align: center; margin: 20px;">오디션 참가 등록</h3>
		<form action="joinProcess.jsp" onsubmit="return submitBtn(this)" onreset="return resetBtn(this)">
			<table border="1" style="margin: auto;">
				<tr>
					<th>참가번호</th>
					<td><input type="text" name="artist_id"/></td>
				</tr>
				<tr>
					<th>참가자이름</th>
					<td><input type="text" name="artist_name"/></td>
				</tr>
				<tr>
					<th>참가자성별</th>
					<td>
						<select name="artist_gender">
							<option value="성별">성별</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>특기</th>
					<td>
						<select name="talent">
							<option value="특기">특기</option>
							<option value="01">보컬</option>
							<option value="02">댄스</option>
							<option value="03">랩</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>소속사</th>
					<td><input type="text" name="agency"/></td>
			 	</tr>
			 	<tr>
			 	<tr>
			 		<td colspan="2" style="text-align: center;">
			 			<input type="submit" value="등록" />
			 			<input type="reset" value="다시쓰기" />
			 		</td>
			 	</tr>
			</table>
		</form>
	</section>
	<footer style="background: gray; color: white; width: 100%; text-align: center; padding: 1.5%; position: absolute; bottom: 0;">
		<p>
			HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
		</p>
	</footer>
</body>
</html>