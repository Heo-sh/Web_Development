<%@page import="java.util.Date"%>
<%@page import="vo.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- c(Core) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- fmt(format): 출력형식(날짜, 숫자) -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	List<String> array = new ArrayList<>();
	array.add("서울");	
	array.add("대전");	
	array.add("대구");	
	
	request.setAttribute("array", array);
	
	int n = 10;
	
	request.setAttribute("n", n);
	
	Person p1 = new Person();
	p1.setName("홍길동");
	p1.setAge(30);
	
	Person p2 = new Person();
	p2.setName("박길동");
	p2.setAge(29);
	
	List<Person> list = new ArrayList<>();
	list.add(p1);
	list.add(p2);
	
	request.setAttribute("list", list);
	
	int money = 1000000;
	request.setAttribute("money", money);
	
	Date today = new Date();
	request.setAttribute("today", today);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!--  
		JSTL(Jsp Standard Tag Library)
		c(Core)
		- if, choose, forEach와 같은 제어문을 사용할 수 있도록 해주는 library
		-->
		
		<!-- if문 -->
		<c:if test="${n eq 10}">
			<!--  
			<c:out value="참"></c:out>
			-->
			참
		</c:if>
		
		<c:if test="${n ne 10}">
			<!--  
			<c:out value="참"></c:out>
			-->
			참 -> n이 10이므로 이 영역은 출력되지 않는다.
		</c:if>
		
		<hr>
		
		<!-- switch 또는 if - else if -->
		<!-- 여러가지의 조건을 비교할 때는 choose가 효율적이다. -->
		<!-- choose 안에서는 절대 주석 사용 금지: 작동 X -->
		<c:choose>
			<c:when test="${param.msg eq 10}">
				msg는 10이다.<br>
			</c:when>
			<c:when test="${param.msg eq 11}">
				msg는 11이다.<br>
			</c:when>
			<c:otherwise>
				모두 아니다.
			</c:otherwise>
		</c:choose>
		
		<hr>
		
		<!-- 향상된 for문: forEach문 -->
		<!-- 
		var: 값을 담을 변수
		begin: 시작값
		end: 끝값
		step: 증가값
		
		for (int i = 1; i <= 5; i++) {
			System.out.println("안녕" + i);
		}
		-->
		<c:forEach var="i" begin="1" end="5" step="1">
			안녕${i}<br>
		</c:forEach>
		
		<hr>
		
		<!--  
		for (String s : array) {
			System.out.println(s);
		}
		-->
		<c:forEach var="s" items="${array}">
			${s}<br>
		</c:forEach>
		
		<c:forEach var="u" items="${list}">
			${u.name} / ${u.age}<br>
		</c:forEach>
		
		<hr>
		
		<!-- fmt -->
		fmt라이브러리 관련<br>
		<!-- 숫자를 단위 별로 ,를 찍어서 구분해준다. -->
		<fmt:formatNumber value="${money}"/><br>
		<fmt:formatDate value="${today}"/><br>
		<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일"/>	
		<!-- 
		DD: 1월 1일부터 오늘까지 경과된 일수 
		dd: 오늘의 일자
		-->
	</body>
</html>