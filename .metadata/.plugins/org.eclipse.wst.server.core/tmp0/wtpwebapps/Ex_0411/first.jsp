<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- JSP(Javer Server Page): ����ɷ��� ������ �ִ� html
			- JAVA�ڵ嵵 ����� �� �ְ� JavaScript�� ����ϴ� ���� ���� ���� -->
    
<%
// ��Ʈ��Ʈ��(Scriptlet): jsp���� java�ڵ带 ����ϱ� ���� �����ϴ� ����
// �� ���� �ȿ����� JAVA �ڵ� �ۼ� ����

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