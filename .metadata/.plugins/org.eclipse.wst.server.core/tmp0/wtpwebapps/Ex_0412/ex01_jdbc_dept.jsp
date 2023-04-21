<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
	<!-- javax -> 라이브러리에서 왔다고 생각하면 된다 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//톰캣이 JNDI를 검색하기 위해 필요한 클래스(JNDI기법: Java Naming Directory Interface)
	InitialContext ic = new InitialContext();
	
	
	//Resource위치 검색: 프로그램을 구성할만한 모든 참조파일을 Resource라고 한다.
	Context ctx = (Context)ic.lookup("java:comp/env"); 
	//lookup: 조회, jsp에서 db에 대한 리소스가 저장되어 있는 위치 검색
		//- 반환형이 Object이기에 Context 객체로 형변환해줘야한다.
	//java:comp/env: 자바에 내장되어 있는 리소스 자원을 검색하는 상수(고정)
	
	DataSource ds = (DataSource)ctx.lookup("jdbc/oracle_test");
	//DataSource: 검색된 Resource를 통해 필요한 JNDI의 Resource를 검색한다.
	//context.xml파일의 Resource영역에 참조되어 있는 name속성값
	
	Connection conn = ds.getConnection();
	//위에서 준비해둔 경로로 로그인을 시도한다.(접속)
	
	System.out.println("---DB접속 성공---");	
	
	String sql = "select * from dept";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//PreparedStatement: 문자열을 쿼리문으로 변환해준다.
	
	ResultSet rs = pstmt.executeQuery();
	//ResultSet: 실행된 sql문장을 통해 얻어진 결과를 실제로 vo객체에 담아준다.
	
	//부서목록을 저장할 ArrayList만들기
	List<DeptVO> dept_list = new ArrayList<DeptVO>();
	
	while(rs.next()) { //rs.next(): 다음 행이 있으면 true, 없으면 false
		DeptVO vo = new DeptVO();
		
		vo.setDeptno(rs.getInt("deptno")); //rs.get자료형: column에 맞는 자료형을 적는다.
		vo.setDname(rs.getString("dname"));
		vo.setLoc(rs.getString("loc"));
		
		dept_list.add(vo);
	}
	
	//연결 후 사용한 DB는 종료코드를 통해 마무리 지어줘야 한다.
	//DB접속과 관련된 모든 객체는 생성된 역순으로 닫아줘야한다.
	rs.close();
	pstmt.close();
	conn.close();
	
	
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
		<script type="text/javascript">
			function send(data) {
				/* alert(data); */
				var f = document.f;
				/* input으로 데이터를 받아서 넘겨준다. */
				var deptno = f.deptno;
				deptno.value = data;
				
				f.action = "sawon_list.jsp";
				f.method = "GET";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form name="f">
			<table border="1">
				<caption>부서목록</caption>
				<tr>
					<th>부서번호</th>
					<th>부서명</th>
					<th>부서위치</th>
				</tr>
				<%for (int i = 0; i < dept_list.size(); i++) { 
							DeptVO vo = dept_list.get(i);%>
				<tr>
					<td><%= vo.getDeptno() %></td>
					<td>
						<!-- send함수에 부서번호를 파라미터로 보낸다는 뜻 -->
						<a href="javascript:send(<%= vo.getDeptno() %>)">
							<%= vo.getDname() %>
						</a>
					</td>
					<td><%= vo.getLoc() %></td>
				</tr>
				<%} %>
			</table>
			<input
				type="hidden"
				name="deptno"
			>
		</form>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
</html>