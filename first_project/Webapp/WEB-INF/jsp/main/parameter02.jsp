<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
    // ���ڵ�
    request.setCharacterEncoding("euc-kr");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ĸ����Ͱ� ��� ������</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String hobby = request.getParameter("hobby");
	
	String jdburl="jdbc:oracle:thin:@localhost:1521:orcl"; 
	String dbid = "c##dbtest"; 
	String dbpass ="1234"; 
	
	ResultSet rs = null;
	String sql_1 = "select * from impl";
	Connection con = null;		
	Statement stmt_v = null;
	
	PreparedStatement pstmt = null; 
	
	try{ 
		Class.forName("oracle.jdbc.OracleDriver"); 
	Connection conn = DriverManager.getConnection(jdburl , dbid, dbpass); 
	System.out.println("����");
	String sql = "INSERT INTO impl (name, address, hobby) VALUES (?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, name);
	pstmt.setString(2, address); 
	pstmt.setString(3, hobby);
	
	pstmt.executeUpdate();
	
	conn.close();
	pstmt.close();
	
	}catch(Exception e){
		System.out.println("Exception :" + e.getMessage());
		}

	%><br>

	�̸� :
	<%= request.getParameter("name") %><br> �ּ� :
	<%= request.getParameter("address") %><br> ��� :
	<%
       
        String[] values = request.getParameterValues("hobby");
        if(values != null){
            for(int i=0; i<values.length; i++){        
    %>
	<%=values[i] %>
	<%                        
            }
        }
    %>
	<br>
	<br><br>

	<%
		try {
		// �����ͺ��̽��� �����ϱ� ���� ����̹� SW �ε�
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// �����ͺ��̽��� �����ϴ� �۾� ����
		con = DriverManager.getConnection(jdburl, dbid, dbpass);
		// ������ ����gkf ��ü ����
		stmt_v = con.createStatement();
		// ���� ����
		rs = stmt_v.executeQuery(sql_1);
	%>
	<table border="1">
		<tr>
			<td>�̸�</td>
			<td>�ּ�</td>
			<td>���</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("address")%></td>
			<td><%=rs.getString("hobby")%></td>
		</tr>
		<%
		}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
	if (rs != null) {
		rs.close();
	}
	if (stmt_v != null) {
		stmt_v.close();
	}
	if (con != null) {
		con.close();
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	%>
	</table>
</body>
</html>