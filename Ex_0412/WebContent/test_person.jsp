<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	PersonVO p1 = new PersonVO();
	p1.setName("홍길동");
	p1.setAge(30);
	p1.setTel("010-1111-1111");
	
	PersonVO p2 = new PersonVO();
	p2.setName("김자바");
	p2.setAge(38);
	p2.setTel("010-2222-22222");

	//제네릭 : <클래스명>
	List<PersonVO> list = new ArrayList<PersonVO>();
	
	list.add(p1);
	list.add(p2);
	
	



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
			<% for(int i = 0; i < list.size(); i++){ %>
				<tr>
					<td><%= list.get(i).getName() %></td>
					<td><%= list.get(i).getAge() %></td>
					<td><%= list.get(i).getTel() %></td>
				</tr>
			<%} %>
		
		</table>
	</body>
</html>








