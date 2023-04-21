<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	//JSP내장객체 : 보이진 않지만 JSP가 실행되면 존재하는 객체
	//이것들은 Servlet을 만들게 되면 service메서드에 존재하는 객체들이다.
	
	//request(요청처리객체)
	//response(응답처리객체)
	
	//jsp_input.jsp에서 넘겨준 세 개의 파라미터를 수신해보자.
	//test_param.jsp?m_name=ㅁㅁㅁ&m_age=111&m_tel=111
	
	String name = request.getParameter("m_name");
	int age = Integer.parseInt(request.getParameter("m_age"));
	String tel = request.getParameter("m_tel");

	//파라미터로 넘어오는 모든 값은 문자열이나 바이너리타입(1,0)이다.
	//파라미터 데이터는 위의 두 타입이 아닌 정수, 문자, 실수타입 등으로 넘어오는
	//경우가 아예 없다!!

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>전화번호</th>
			</tr>
			<tr>
				<td><%= name %></td>
				<td><%= age %></td>
				<td><%= tel %></td>
			</tr>
		
		</table>
	</body>
</html>





