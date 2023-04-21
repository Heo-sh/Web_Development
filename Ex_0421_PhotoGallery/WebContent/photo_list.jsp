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
						<img src="upload/${vo.filename}">
						<div class="title">${vo.title}</div>
						<div>
							<input type="button" value="삭제">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>
</html>