<%@page import="vo.SjVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* SjDAO sdao= SjDAO.getInstance();
	List<SjVO> list = sdao.selectList(); */
	
	List<SjVO> list = SjDAO.getInstance().selectList(); 
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
		<script type="text/javascript">
			function del(no) {
				if (confirm("정말 삭제하시겠습니까?") == false) {
					return;
				}
				
				location.href = 'sung_del.jsp?no=' + no;
				
				
			} //del
			
			function modify(no, name, kor, eng, mat) {
				location.href = 'sung_update.jsp?no=' + no + "&name=" + name + "&kor=" + kor + "&eng=" + eng + "&mat=" + mat;
			}
		</script>
	</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>평균</th>
			<th>순위</th>
			<th>비고</th>
		</tr>
		<%
			for (int i = 0; i < list.size(); i++) { 
					SjVO svo = list.get(i);
		%>
		<tr>
			<td><%= svo.getNo() %></td>
			<td><%= svo.getName() %></td>
			<td><%= svo.getKor() %></td>
			<td><%= svo.getEng() %></td>
			<td><%= svo.getMat() %></td>
			<%-- <% int total = svo.getKor() + svo.getEng() + svo.getMat(); 
			   float avg = (float)total/3;
			%> --%>	
			<td><%= svo.getTot() %></td>
			<td><%= svo.getAvg() %></td>
			<td><%= svo.getRank() %></td>
			<td>
				<input
					type="button"
					value="삭제"
					onclick="del('<%= svo.getNo() %>')"
				>
				<input
					type="button"
					value="수정"
					onclick="modify('<%= svo.getNo() %>',
									'<%= svo.getName() %>', 
									'<%= svo.getKor() %>', 
									'<%= svo.getEng() %>', 
									'<%= svo.getMat() %>')"
				>
			</td>
		</tr>
		<%} %>
		<tr>
			<td colspan="9" align="center">
				<input
					type="button"
					value="학생정보 추가하기"
					onclick="location.href='sung_register.jsp'"
				>
			</td>	
		</tr>
	</table>
</body>
</html>