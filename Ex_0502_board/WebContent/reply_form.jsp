<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			img {
				cursor: pointer;
			}
			
			img:hover {
				background-color: gray;
			}
		</style>
		<script type="text/javascript">
			function send_check() {
				var f = document.f;
				
				//유효성 검사
				
				f.submit();
			}
		</script>		
	</head>
	<body>
		<form
			name="f"
			method="GET"
			action="reply.do"
		>
			<!-- ref에 idx값을 넣어주기 위해서 hidden으로 받는다. -->
			<input type="hidden" name="idx" value="${param.idx}"> 
			<input type="hidden" name="page" value="${param.page}"> 
			<table border="1">
				<caption>:::답글 달기:::</caption>
				<tr>
					<th>제목</th>
					<td>
						<input name="subject" style="width: 345px;">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input name="name" style="width: 345px;">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="10" cols="50" style="resize: none">
						</textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input name="pwd" type="password">	
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<img src="img/btn_reg.gif" onclick="send_check();">
						<img src="img/btn_back.gif" onclick="location.href='board_list.do'">
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>