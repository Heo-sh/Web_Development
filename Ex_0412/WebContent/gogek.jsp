<%@page import="vo.GogekVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
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

System.out.println("---DB접속 성공---");	//2.<- 그래서 이게 나온다면 db접속 완료

String sql = "select * from gogek"; //1.<- 여기서 접속할 dbtable명을 바꿔줘야 한다.

PreparedStatement pstmt = conn.prepareStatement(sql);
//PreparedStatement: 문자열을 쿼리문으로 변환해준다.

ResultSet rs = pstmt.executeQuery();
//ResultSet: 실행된 sql문장을 통해 얻어진 결과를 실제로 vo객체에 담아준다.

//부서목록을 저장할 ArrayList만들기
List<GogekVO> gogek_list = new ArrayList<GogekVO>();

while(rs.next()) { //rs.next(): 다음 행이 있으면 true, 없으면 false
	GogekVO vo = new GogekVO();
	
	vo.setGobun(rs.getInt("gobun"));
	vo.setGoname(rs.getString("goname"));
	vo.setGoaddr(rs.getString("goaddr"));
	vo.setGojumin(rs.getString("gojumin"));
	vo.setGodam(rs.getInt("godam"));
	
	gogek_list.add(vo);
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
	</head>
	<body>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>주민번호</th>
				<th>담당자 번호</th>
			</tr>
			<%for (int i = 0; i < gogek_list.size(); i++) {
						GogekVO vo = gogek_list.get(i);%>
			<tr>
				<td><%= vo.getGobun() %></td>
				<td><%= vo.getGoname() %></td>
				<td><%= vo.getGoaddr() %></td>
				<td><%= vo.getGojumin() %></td>
				<td><%= vo.getGodam() %></td>
			</tr>
			<%} %>
		</table>
	</body>
</html>