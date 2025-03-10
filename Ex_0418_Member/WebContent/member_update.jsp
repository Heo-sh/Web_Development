<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function update(f) {
				var name = f.name.value.trim();
				var id = f.id.value.trim();
				var pw = f.pw.value.trim();
				var email = f.email.value.trim();
				
				if (name == '') {
					alert("이름을 입력하세요");
					return;
				}
				if (id == '') {
					alert("아이디를 입력하세요");
					return;
				}
				if (pw == '') {
					alert("비밀번호를 입력하세요");
					return;
				}
				if (email == '') {
					alert("이메일을 입력하세요");
					return;
				}
				
				f.action = "member_reinsert.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<input
				name="idx"
				value="<%= idx %>"
				type="hidden"
			>
			<table border="1">
				<caption>회원 정보 입력</caption>
				<tr>
					<th>이름</th>
					<td>
						<input 
							name="name"
							value="<%= name %>"
						>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input 
							name="id"
							value="<%= id %>"
						>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input 
							name="pw"
							value="<%= pw %>"
						>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input 
							name="email"
							value="<%= email %>"
						>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input 
						type="button" 
						value="수정하기"
						onclick="update(this.form)"
					> 
					<input 
						type="button"
						value="취소하기" 
						onclick="location.href='member.jsp'"
					>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>