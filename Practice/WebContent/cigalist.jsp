<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>담배 이름</th>
				<th>가격</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.cinum}</td>
					<td>${vo.name}</td>
					<td>${vo.cost}</td>
				</tr>
			</c:forEach>
		</table>	
	</body>
</html>