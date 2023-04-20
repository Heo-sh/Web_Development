<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
JSON(JavaScript Object Notation) 표기법
- 서로 다른 프로그램에서 데이터를 교환하기 편하도록 규격화된 표기법
- 어떠한 언어로 받아도 상관 X -> JSON으로 보냄
- 공용어 같은 개념
-->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			//{'key' : 'value'}
			//value에 넣을 수 있는 데이터
			//- 숫자: 정수, 실수, 지수 -> JSON에서는 8진수나 16진수를 표현하는 법이 없다.
			//- 문자열
			//- 논리형: true, false
			//- 객체
			//- 배열
			//- null
			
			var p = {'name' : '홍길동', 'age' : 20, 'tel' : '010-1111-1111'};
			
			document.write("이름: " + p.name + "<br>");
			document.write("나이: " + p.age + "<br>");
			document.write("번호: " + p.tel + "<br>");
			
			document.write("<hr>");
			
			//JSON 1차원 배열
			var p_arr = [
						 {'name' : '홍길동', 'age' : 20, 'tel' : '010-1111-1111'},
						 {'name' : '이길동', 'age' : 30, 'tel' : '010-2222-2222'}
						];
			
			document.write(p_arr[0].name + "/" + p_arr[0].age + "<br>");
			document.write(p_arr[1].name + "/" + p_arr[1].age + "<br>");
			
			document.write("<hr>");
			
			//JSON 다차원 배열
			var course = {
						  'name' : '웹앱개발',
						  'start' : '2023-02-13',
						  'end' : '2030-07-07',
						  'sub' : ['java', 'jsp', 'spring'],
						  'student': [{'name' : '홍길동', 'age': 20},
							  		  {'name' : '이길동', 'age': 30}
							  		 ]
						 };
			
			document.write("수강명: " + course.name + "<br>");
			document.write("시작일: " + course.start + "<br>");
			document.write("종료일: " + course.end + "<br>");
			document.write("과목: " + course.sub[0] + ", " + course.sub[1] + ", " + course.sub[2] + "<br>");
			document.write("수강생: " + course.student[0].name + "/" + course.student[0].age + "<br>");
			document.write("수강생: " + course.student[01].name + "/" + course.student[1].age);
		</script>
	</head>
	<body>
			
	</body>
</html>

































