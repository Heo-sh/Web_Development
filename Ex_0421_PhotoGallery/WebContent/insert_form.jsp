<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function send(f) {
				var title = f.title.value.trim();
				var pwd = f.pwd.value.trim();
				var photo = f.photo.value.trim();
				
				if (title == '') {
					alert('제목을 입력하시오');
					return;
				}
				if (pwd == '') {
					alert('비밀번호를 입력하세요');
					return;
				}
				if (photo == '') {
					alert('파일을 넣으세요');
					return;
				}
				
				f.submit();
			}
		</script>
	</head>
	<body>
		<form 
			action="insert.do"
			method="POST"
			enctype="multipart/form-data"
		>
			<table border="1" align="center">
				<caption>사진 등록하기</caption>
				<tr>
					<th>제목</th>
					<td>
						<!-- 전송을 위한 name속성 -->
						<input name="title">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input name="pwd" type="password">
					</td>
				</tr>
				<tr>
					<th>등록할 사진</th>
					<td>
						<input name="photo" type="file">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록하기" onclick="send(this.form)">
						<input type="button" value="취소하기" onclick="location.href='list.do'">
						<!-- location.href='list.do' 리스트를 조회하고 jsp로 가야하기 때문에 경로는 list.do이다. -->
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>