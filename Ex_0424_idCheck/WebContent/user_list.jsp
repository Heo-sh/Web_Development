<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script type="text/javascript">
			function del(f) { //del(idx)
				var idx = f.idx.value; //var idx = idx;
				
				if (!confirm("삭제하시겠습니까?")) {
					return;
				}
				
				//삭제를 원하는 사람들은 idx를 Ajax를 통해서 서버로 전송
				var url = "user_del.do";
				
				var param = "idx=" + idx;
				
				sendRequest(url, param, resultFn, "POST");
			}
			
			function resultFn() {
				if (xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					
					var json = eval(data);
					
					if (json[0].res == 'yes'){
						alert("삭제되었습니다.");
					} else {
						alert("삭제 실패");
					}
					
					location.href = "user_list.do"; //삭제된 후의 새로고침
				}
			}
		</script>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="5" align="center">
				<input 
					type="button" 
					value="회원가입"
					onclick="location.href='user_insert_form.jsp'"
				>
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>비고</th>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.name}</td>
				<td>${vo.id}</td>
				<td>${vo.pwd}</td>
				<td>
					<!--
						form으로 보내는 방법과 변수를 직접 담아 보내는 방법이 있다. 
						<input
							type="button"
							value="삭제"
							onclick="del('${vo.idx}')
						>
					 -->
					<form>
						<input type="hidden" name="idx" value="${vo.idx}">
						<input
							type="button" 
							value="삭제" 
							onclick="del(this.form)"
						>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>