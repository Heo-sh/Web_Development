<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			a {
				text-decoration: none;
			}
			table {
				border-collapse: collapse;
			}
		</style>
	</head>
	<body>
		<table border="1" width="700">
			<tr>
				<td colspan="5">
					<img src="img/title_04.gif">
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th width="350">제목</th>
				<th width="120">작성자</th>
				<th width="100">작성일</th>
				<th width="50">조회수</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td align="center">${vo.idx}</td>
					<td>
						<!-- 답글일 경우 들여쓰기 &nbsp; : 띄어쓰기 엔티티코드-->
						<c:forEach begin="1" end="${vo.depth}">&nbsp;</c:forEach>
						<c:if test="${vo.depth ne 0}">ㄴ</c:if>
						<!-- 삭제가 되지 않은 게시물 정상적으로 표시 -->
						<c:if test="${vo.del_info ne -1}">						
							<a href="view.do?idx=${vo.idx}">
								<font color="black">
									${vo.subject}							
								</font>
							</a>
						</c:if>
						<!-- 삭제가 된 게시물은 클릭을 못 하게 변경 -->
						<c:if test="${vo.del_info eq -1}">						
							<font color="gray">
								${vo.subject}							
							</font>
						</c:if>
					</td>
					<td>${vo.name}</td>
					<c:if test="${vo.del_info ne -1}">
						<td>
							${fn:split(vo.regdate, ' ')[0]}
						</td>					
					</c:if>
					<!-- 삭제된 게시물은 날짜를 unknown으로 표시 -->
					<c:if test="${vo.del_info eq -1}">
						<td>
							unknown
						</td>					
					</c:if>
					<td align="center">${vo.readhit}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center">
					◀ 1 2 3 ▶
				</td>
			</tr>
			<tr>
				<td colspan="5" align="right">
					<img
						style="cursor: pointer;" 
						src="img/btn_reg.gif"
						onclick="location.href='insert_form.jsp'"
					/>
				</td>
			</tr>
		</table>
	</body>
</html>






















