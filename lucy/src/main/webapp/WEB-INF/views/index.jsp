<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인화면</title>
	</head>
	<body>
		${sessionScope.m.m_id}님 안녕하세요. <br>
		<a href = "/demo/logout">로그아웃</a><br>
		
		이름 : <%= request.getParameter("name") %><br>
		이름 : <%= request.getParameter("address") %><br>
		
	</body>
</html>