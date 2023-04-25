<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
			//아이디 중복체크 여부 => true or false 2가지 밖에 없다.
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
				
	 			if (!b_idCheck) {
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
					//"[{'res' : '%s'}]"
					var data = xhr.responseText;
					
					//문자열로 넘어온 JSON배열을 데이터로 변환
					var json = eval(data);
					
					if (json[0].res == 'no') {
						alert("이미 사용중인 id입니다.");
						return;
						//alert으로 알려주는 것도 있지만 다른 변화를 줄 수도 있다. 가능성은 무한함
					} else {
						alert("사용 가능한 id입니다.");
						b_idCheck = true; //true로 바꿔줘야지 send(f)메서드로 들어가서 반복하지 않는다.
					}
				}
			} //resultFn()
			
			function che() {
				b_idCheck = false;
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
						<!-- onchange속성: input태그의 포커스가 벗어났을 때(즉, 입력이 끝났을 때) 이벤트 발생 -->
						<input name="id" id="id" onchange="che()">
						<input type="button" value="중복체크" onclick="check_id()">
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