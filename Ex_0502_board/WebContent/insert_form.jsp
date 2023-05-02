<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			table {
				border-collapse: collapse;
			}
		</style>
		<script type="text/javascript">
			function send_check() {
				var f = document.f; //f라는 name을 가진 form태그의 정보
				
				//유효성 검사
				if(f.subject.value == '') {
					alert('제목을 입력하세요!');
					f.subject.focus();
					return;
				}
				
				if(f.name.value == '') {
					alert('작성자 입력하세요!');
					f.subject.focus();
					return;
				}
				
				if(f.content.value.trim() == '') {
					alert('내용을 입력하세요!');
					f.content.focus();
					return;
				} 
				
				if(f.pwd.value == '') {
					alert('비밀번호 입력하세요!');
					f.pwd.focus();
					return;
				}
				
				f.submit();
			}
		</script>
	</head>
	<body>
		<form 
			name="f"
			method="GET"
			action="insert.do"
		>
			<table border="1">
				<caption>:::새 글 쓰기:::</caption>
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
						<!--
						textara: form 태그의 자식 태그 중 하나  
						rows(행): 세로로 보여질 공간
						cols(열): 가로로 보여질 공간
						-->
						<textarea name="content" rows="10" cols="50" style="resize: none"></textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input name="pwd" type="password">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<img src="img/btn_reg.gif" onclick="send_check();" style="cursor: pointer;">
						<img src="img/btn_back.gif" onclick="location.href='board_list.do'" style="cursor: pointer;">
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>