<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- JSP(Javer Server Page): 연산능력을 가지고 있는 html
			- JAVA코드도 사용할 수 있고 JavaScript를 사용하는 데도 제한 없음 -->
    
<%
// 스트립트릿(Scriptlet): jsp에서 java코드를 사용하기 위해 지정하는 영역
// 이 영역 안에서만 JAVA 코드 작성 가능

// request(요청객체), responst(응답객체) 등의 객체는
// jsp가 web페이지로 전환되는 과정에서 만나는 Servlet클래스가 가진 객체이므로
// jsp에서는 Servlet클래스가 허용하는 범위 안에서 객체를 마음대로 가져다 사용 가능

	String ip = request.getRemoteAddr();
	
	Random rnd = new Random();
	int rand = rnd.nextInt(5)+1;
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%= 
		ip
		%>
		<P>&lt;%@내용%&gt; : jsp 헤더 - 실행 시 인코딩, import 등을 위해 반드시 지정해야 하는 영역</P>
		<P>&lt;% 자바코드 %&gt; : 스크립트릿 - jsp에서 자바코드를 작성하기 위해 생성하는 영역</P>
		<P>&lt;%= 변수명%&gt; : 스크립트릿의 출력코드</P>
		난수: <%= rand %>
	</body>
</html>