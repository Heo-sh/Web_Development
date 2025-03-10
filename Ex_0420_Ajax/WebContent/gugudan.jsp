<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  
Ajax(Asynchronous JavaScript and XML)
- 자바스크립트를 이용한 백그라운드 통신 기술(비동기 통신)
- '부분'새로고침
-->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!--  
		js/httpRequest.js를 위한 script라서
		새로운 javascript코드를 쓰려면
		다른 script태그를 써야 한다.
		아무 것도 작성하면 안된다.
		-->
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
			function send() {
				var dan = document.getElementById("dan").value;
				
				var url = "gugudan_ajax.jsp"; //목적지
				
				var param = "dan=" + dan; //파라미터
				
				//sendRequest()메서드를 호출하지 않는다면
				//location.href = "gugudan_ajax.jsp?dan=" + dan;
				
				sendRequest(url, param, resultFn, "GET"); //sendRequest()메서드 호출
			} //send()
			
			//callback함수는 다른 함수 밖에다가 만들어야 한다.
			//callback함수 내부에 데이터를 받을 코드를 작성한다.
			function resultFn() { 
				//alert("call back");
				
				//Ajax에서 서버로부터 응답을 확인하기 위해 사용하는 XMLHttpRequest객체의 property는 다음과 같습니다.
				//1.readyState
				//- XMLHttpRequest객체의 상태를 보여준다.
				//- UNSET(숫자 : 0): XMLHttpRequest객체 생성됨
				//- OPEND(숫자 : 1): open()메서드가 성공적으로 실행됨
				//- HEADERS_RECEIVED(숫자 : 2): 모든 요청에 대한 응답이 도착함
				//- LOADING(숫자 : 3): 요청한 데이터를 처리 중
				//- DONE(숫자 : 4): 요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨
				//2.status
				//- 서버의 문서상태를 나타낸다.
				//- 200: 서버에 문서가 존재함(문제없음)
				//- 404: 서버에 문서가 존재하지 않음
				//3.onreadystatechange
				console.log(xhr.readyState + " / " + xhr.status);
				
				if (xhr.readyState == 4 && xhr.status == 200) {
					//도착한 데이터 읽어오기
					var data = xhr.responseText; //최종결과값을 갖고 돌아온다.
					//alert(data);
					
					//innerHTML이 중복되는 태그들을 알아서 제거해준다.
					document.getElementById("disp").innerHTML = data;
				}
			}
			
		</script>
	</head>
	<body>
		단: <input id="dan"> <!-- form태그 안에 있는 input태그의 value를 보낼 때는 name속성을 쓰고 그러지 않을 때는 id속성을 쓰는 게 좋다. -->
		<input type="button" value="결과보기" onclick="send()">
		<br>
		<div id="disp"></div>
	</body>
</html>