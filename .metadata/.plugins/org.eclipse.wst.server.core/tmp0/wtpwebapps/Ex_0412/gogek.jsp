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
//��Ĺ�� JNDI�� �˻��ϱ� ���� �ʿ��� Ŭ����(JNDI���: Java Naming Directory Interface)
InitialContext ic = new InitialContext();


//Resource��ġ �˻�: ���α׷��� �����Ҹ��� ��� ���������� Resource��� �Ѵ�.
Context ctx = (Context)ic.lookup("java:comp/env"); 
//lookup: ��ȸ, jsp���� db�� ���� ���ҽ��� ����Ǿ� �ִ� ��ġ �˻�
	//- ��ȯ���� Object�̱⿡ Context ��ü�� ����ȯ������Ѵ�.
//java:comp/env: �ڹٿ� ����Ǿ� �ִ� ���ҽ� �ڿ��� �˻��ϴ� ���(����)

DataSource ds = (DataSource)ctx.lookup("jdbc/oracle_test");
//DataSource: �˻��� Resource�� ���� �ʿ��� JNDI�� Resource�� �˻��Ѵ�.
//context.xml������ Resource������ �����Ǿ� �ִ� name�Ӽ���

Connection conn = ds.getConnection();
//������ �غ��ص� ��η� �α����� �õ��Ѵ�.(����)

System.out.println("---DB���� ����---");	//2.<- �׷��� �̰� ���´ٸ� db���� �Ϸ�

String sql = "select * from gogek"; //1.<- ���⼭ ������ dbtable���� �ٲ���� �Ѵ�.

PreparedStatement pstmt = conn.prepareStatement(sql);
//PreparedStatement: ���ڿ��� ���������� ��ȯ���ش�.

ResultSet rs = pstmt.executeQuery();
//ResultSet: ����� sql������ ���� ����� ����� ������ vo��ü�� ����ش�.

//�μ������ ������ ArrayList�����
List<GogekVO> gogek_list = new ArrayList<GogekVO>();

while(rs.next()) { //rs.next(): ���� ���� ������ true, ������ false
	GogekVO vo = new GogekVO();
	
	vo.setGobun(rs.getInt("gobun"));
	vo.setGoname(rs.getString("goname"));
	vo.setGoaddr(rs.getString("goaddr"));
	vo.setGojumin(rs.getString("gojumin"));
	vo.setGodam(rs.getInt("godam"));
	
	gogek_list.add(vo);
}

//���� �� ����� DB�� �����ڵ带 ���� ������ ������� �Ѵ�.
//DB���Ӱ� ���õ� ��� ��ü�� ������ �������� �ݾ�����Ѵ�.
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
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>�ּ�</th>
				<th>�ֹι�ȣ</th>
				<th>����� ��ȣ</th>
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