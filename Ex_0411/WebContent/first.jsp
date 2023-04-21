<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- JSP(Javer Server Page): 연산능력을 가지고 있는 html
			- JAVA코드도 사용할 수 있고 JavaScript를 사용하는 데도 제한 없음 -->
    
<%
// 스트립트릿(Scriptlet): jsp에서 java코드를 사용하기 위해 지정하는 영역
// 이 영역 안에서만 JAVA 코드 작성 가능

	String ip = request.getRemoteAddr();

%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%= 
		ip
		%>
	</body>
</html>