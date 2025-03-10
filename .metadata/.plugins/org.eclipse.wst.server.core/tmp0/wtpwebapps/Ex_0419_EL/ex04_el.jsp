<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Person vo = new Person();
	
	vo.setName("홍길동");
	vo.setAge(20);
	
	request.setAttribute("vo", vo);

	Person vo2 = new Person();
	
	vo2.setName("이길동");
	vo2.setAge(30);
	
	List<Person> list = new ArrayList<>();
	list.add(vo);
	list.add(vo2);
	
	request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 
		${vo.name}: vo 객체에 있는 getName()메서드를 호출해준다. 
					따라서 vo에 반드시 getter가 생성되어 있어야 한다.
		-->
		이름: ${vo.name}<br>
		나이: ${vo.age}<br>
		
		<hr>
		
		이름: ${list[0].name}<br>
		나이: ${list[0].age}<br>
		이름: ${list[1].name}<br>
		나이: ${list[1].age}<br>
	</body>
</html>