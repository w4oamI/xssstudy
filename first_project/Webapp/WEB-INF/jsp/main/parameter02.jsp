<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
    // 인코딩
    request.setCharacterEncoding("euc-kr");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파리미터값 출력 페이지</title>
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
	System.out.println("성공");
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

	이름 :
	<%= request.getParameter("name") %><br> 주소 :
	<%= request.getParameter("address") %><br> 취미 :
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
		// 데이터베이스를 접속하기 위한 드라이버 SW 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 데이터베이스에 연결하는 작업 수행
		con = DriverManager.getConnection(jdburl, dbid, dbpass);
		// 쿼리를 생성gkf 객체 생성
		stmt_v = con.createStatement();
		// 쿼리 생성
		rs = stmt_v.executeQuery(sql_1);
	%>
	<table border="1">
		<tr>
			<td>이름</td>
			<td>주소</td>
			<td>취미</td>
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