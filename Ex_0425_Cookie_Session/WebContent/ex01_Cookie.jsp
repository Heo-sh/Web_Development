<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("param1", "asdfqwer");
	response.addCookie(cookie);
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		쿠키저장완료<br>
		쿠키이름 : ${cookie.param.name}<br>
		쿠키내용 : ${cookie.param.value}<br>
	</body>
</html>