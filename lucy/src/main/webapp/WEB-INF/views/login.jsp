<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/demo</title>
	</head>
	<body>
		<h3> JSON_XSS </h3>
		<input type = "text" id = "m_id" placeholder="아이디"><br>
		<input type = "password" id = "m_pw" placeholder="비밀번호"><br>
		<button id = "login_process">로그인</button>
		<p>회원가입은  <a href = "/demo/register">여기</a>를 누르세요.</p>
		
		<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
		<script>
		$(document).ready(function(){
			$("#login_process").click(function(){
				var json = {
					m_id : $("#m_id").val(),
					m_pw : $("#m_pw").val()
				};
				
				 $.ajax({
					type : "post",
					url : "Login",
					dataType : 'json',
					contentType: 'application/json; charset=utf-8',
					data : JSON.stringify(json),
					success : function(data) {
						switch (Number(data)) {
						case 0:
							alert("아이디 또는 비밀번호가 일치하지 않습니다.");
							break;
						case 1:
							window.location.href = "/demo/index";
						default:
							alert("오류 발생"+ error);
							break;
						}
					},
					error : function(error) {
						window.location.href = "/demo/index"
					}
				});
			});
		});
		</script>
		
		<h4> POST_XSS </h4>
		<form action="index" method="post">

		이름 : <input type="text" name="name" size="30" id="name" placeholder="XSS미적용"><br>
		주소 : <input type="text" name="address" size="30" id="address" placeholder="XSS적용"><br>
		<input type="submit" value="전송">
		</form>
		
	</body>
</html>