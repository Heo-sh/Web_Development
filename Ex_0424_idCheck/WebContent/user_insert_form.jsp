<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
			var b_idCheck = false;
			
		
			function send(f) {
				var id = f.id.value.trim();
				var name = f.name.value.trim();
				var pwd = f.pwd.value.trim();
				
				if (id == '') {
					alert('아이디를 입력하세요.');
					return;
				}
				if (name == '') {
					alert('이름을 입력하세요.');
					return;
				}
				if (pwd == '') {
					alert('비밀번호를 입력하세요.');
					return;
				}
				
	 			if (!b_idcheck) {
					alert("아이디 중복체크하세요");
					return;
				} 
				
				f.action = "insert.do";
				f.method = "GET";
				f.submit();
			}
			
		 	//아이디 중복체크를 위한 메서드
			function check_id() {
				var id = document.getElementById("id").value.trim();
				
				if (id == '') {
					alert("아이디 입력하세요!");
					return;
				}
				
				//id를 Ajax를 통해서 서버로 전송
				var url = "check_id.do";
				
				//encodeURIComponent(id): 특수문자가 들어가 있는 경우를 대비하여 인코딩하여 보낸다.
				var param = "id=" + encodeURIComponent(id);
				
				sendRequest(url, param, resultFn, "POST");
			}
			
			function resultFn() {
				if(xhr.readyState == 4 && xhr.status == 200){
					
				}
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<caption>:::회원가입:::</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input name="id" id="id" type="text">
						<input type="button" value="중복체크">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input name="name" type="text">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input name="pwd" type="password">
					</td>
				</tr>
				<tr>
					<td colspan="2" align ="center">
						<input type="button" value="가입" onclick="send(this.form);"> 
						<input type="button" value="취소" onclick="location.href='user_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>