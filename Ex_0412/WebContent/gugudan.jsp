<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	for(int i = 1; i<=9; i++){
 		for(int j = 2; j<=9; j++){
 			System.out.printf("%d x %d = %d ",i,j,i*j);
 		}
 		System.out.println();
 	}
 
 %>   
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
		 	<% for(int i = 1; i<=9; i++){%>
		 		<tr>
 				<% for(int j = 2; j<=9; j++){%>
 					<%-- <td><%= j %> x <%= i %> = <%= i*j %></td> --%>
 					<td>
 						<% String str = String.format("%d * %d = %d",j,i,j*i); %>
 						<%= str %>
 					</td>
 				<% }%>
 				</tr>
 		   <%} %>
 		</table>
	</body>
</html>




