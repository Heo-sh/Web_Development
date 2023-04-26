<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
			function send(f) {
				var id = f.id.value.trim();
				var pw = f.pw.value.trim();
				
				//유효성 검사
				if (id == "") {
					alert("아이디 입력!");
					return;
				}
				
				if (pw == "") {
					alert("비밀번호 입력!");
					return;
				}
				
				var url = "login.do";
				var param = "id=" + encodeURIComponent(id) + "&pw=" + encodeURIComponent(pw);
				
				sendRequest(url, param, myCheck, "POST");
			}
			
			function myCheck() {
				if (xhr.readyState == 4 & xhr.status == 200) {
					var data = xhr.responseText;
					
					var json = eval(data);
					
					if (json[0].param == 'no_id') {
						alert("아이디 존재 X");
					} else if (json[0].param == 'no_pw') {
						alert("비밀번호 틀림");
					} else {
						alert('로그인 성공');
						location.href = "main_content.jsp";
					}
					
				}
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1" align="center">
				<caption>:::Login:::</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input name="id">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input name="pw" type="password">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input 
							type="button" 
							value="로그인" 
							onclick="send(this.form)"
						>
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>