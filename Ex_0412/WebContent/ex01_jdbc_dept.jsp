<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
	<!-- javax -> ���̺귯������ �Դٰ� �����ϸ� �ȴ� -->
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
	
	System.out.println("---DB���� ����---");	
	
	String sql = "select * from dept";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//PreparedStatement: ���ڿ��� ���������� ��ȯ���ش�.
	
	ResultSet rs = pstmt.executeQuery();
	//ResultSet: ����� sql������ ���� ����� ����� ������ vo��ü�� ����ش�.
	
	//�μ������ ������ ArrayList�����
	List<DeptVO> dept_list = new ArrayList<DeptVO>();
	
	while(rs.next()) { //rs.next(): ���� ���� ������ true, ������ false
		DeptVO vo = new DeptVO();
		
		vo.setDeptno(rs.getInt("deptno")); //rs.get�ڷ���: column�� �´� �ڷ����� ���´�.
		vo.setDname(rs.getString("dname"));
		vo.setLoc(rs.getString("loc"));
		
		dept_list.add(vo);
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
		<script type="text/javascript">
			function send(data) {
				/* alert(data); */
				var f = document.f;
				/* input���� �����͸� �޾Ƽ� �Ѱ��ش�. */
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
				<caption>�μ����</caption>
				<tr>
					<th>�μ���ȣ</th>
					<th>�μ���</th>
					<th>�μ���ġ</th>
				</tr>
				<%for (int i = 0; i < dept_list.size(); i++) { 
							DeptVO vo = dept_list.get(i);%>
				<tr>
					<td><%= vo.getDeptno() %></td>
					<td>
						<!-- send�Լ��� �μ���ȣ�� �Ķ���ͷ� �����ٴ� �� -->
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