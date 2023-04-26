<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/photo.css">
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
			function del(f) {
				var idx = f.idx.value;
				var pwd = f.pwd.value.trim(); //원본 비밀번호
				var pwd2 = f.pwd2.value.trim(); //입력한 비밀번호
				//alert(idx);
				//var filename = f.filename.value;
				
				if (pwd2 == null) {
					alert("입력하라");
				}
				
				if (pwd != pwd2) {
					alert("비밀번호 불일치");
					return;
				}
				
				if (!confirm("삭제하시겠습니까?")) {
					return;
				}
				
				//삭제를 원하는 idx를 서버로 전송
				var url = "photo_del.do";
				var param = "idx=" + idx + "&filename=" + f.filename.value;
				
				//AJAX로 보내기
				sendRequest(url, param, finRes, "POST");				
			}
			
			function finRes() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					//Servlet으로부터 도착한 데이터 읽어오기
					var data = xhr.responseText;
					
					//넘겨받은 데이터는 ""로 묶여진 문자열 구조로 인식하기 때문에
					//JSON형식으로 변경해줘야 한다.
					var json = eval(data);
					
					if (json[0].param == 'yes') {
						alert("삭제 성공");
					} else {
						alert("삭제 실패");
					}
					
					location.href = "list.do";
				}
			}
			
			function download(fn) {
				
				location.href = "FileDownload.do?dir=/upload/&filename=" + fn;
			}
		</script>
	</head>
	<body>
		<div id="main_box">
			<h1>:::Photo Gallery:::</h1>
			
			<div align="center">
				<input type="button" value="사진등록" onclick="location.href='insert_form.jsp'">
				<!-- 프로젝트의 확장성(기능추가)을 염두해둔다면 Servlet으로 보내도 무방 -->
				<!-- jsp에서 jsp로 넘어가는 경우에는 새로운 기능을 추가하는 게 쉽지가 않으므로 애초부터 Servlet으로 만들어 아무 것도 하지 않아도 이후의 일을 생각하는 경우도 나쁘지 않음 -->
			</div>
			
			<!--  
			for (PhotoVO vo: list) {
				System.out.println(vo.getTitle());
				System.out.println(vo.getFilename());
				....
			};
			-->
			<div id="photo_box">
				<c:forEach var="vo" items="${list}">
					<div class="photo_type">
						<!-- 절대경로에 저장하여도 상대경로에는 보이진 않지만 조회는 가능하다. -->
						<img src="upload/${vo.filename}">
						<div class="title">제목: ${vo.title}</div>
						<!-- 전체를 form태그로 묶는 것보다는 보낼 데이터만 묶는 것이 좋다. -->
						<form>
							<input type="hidden" name="idx" value="${vo.idx}">
							<input type="hidden" name="filename" value="${vo.filename}">
							<input type="hidden" name="pwd" value="${vo.pwd}">
							<div align="center">
								<input type="password" name="pwd2" size="5">
								<input type="button" value="down" onclick="download('${vo.filename}')">
								<input type="button" value="삭제" onclick="del(this.form)">
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>
</html>