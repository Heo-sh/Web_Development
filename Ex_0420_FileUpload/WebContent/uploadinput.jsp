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
				var photo = f.photo.value.trim();
				
				//유효성체크
				if (title == "") {
					alert("제목을 입력하세요.");
					return;
				}
				if (photo == "") {
					alert("파일을 업로드하세요.");
					return;
				}
				
				//jsp에서는 java클래스 호출불가
				//대신 Servlet 호출 가능
				//f.action = "~.jsp";
				f.action = "upload.do"; //upload.do라는 별칭을 가진 servlet클래스
				f.submit();
			}
		</script>
	</head>
	<body>
		<!-- 
		fileupload를 위해서는 form태그는 무조건이다. 
		file 업로드 시 주의사항
		- 1.form태그의 전송방식은 반드시 post
		- 2.enctype="multipart/form-data" 필수
			=>enctype: form태그의 파일 데이터를 전송할 때 사용하는 인코딩 기법 
		-->
		<form method="post" enctype="multipart/form-data">
			제목: <input name="title"><br>
			첨부: <input type="file" name="photo"><br>
			<!-- 
			웹에서 사용자의 로컬 파일을 입력받기 위해서 input태그의 타입의 속성을 file로
			지정하는 방법을 사용한다.
			-->
			<input type="button" value="업로드" onclick="send(this.form);">
		</form>
	</body>
</html>