<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 자성 데모</title>
	</head>
	<body>
		<h3>## 게시글 작성 페이지 ##</h3>
		<input type = "text" id = "b_title" placeholder="게시글 제목"><br>
		<textarea rows="5" id = "b_content" placeholder="게시글 내용"></textarea><br>
		<button id = "wrtie_process">게시글 작성</button>
		<p>게시글 목록으로 가고 싶다면 <a href = "/demo/board_list">여기</a>를 눌러주세요.</p>
		
		<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
		<script>
			$(document).ready(function(){
				$("#wrtie_process").click(function(){
					var json = {
						b_title : $("#b_title").val(),
						b_content : $("#b_content").val()
					};
					
					for(var str in json){
						if(json[str].length == 0){
							alert($("#" + str).attr("placeholder") + "를 입력해주세요.");
							$("#" + str).focus();
							return;
						}
					}
					
					 $.ajax({
						type : "post",
						url : "board_wrtie",
						data : json,
						success : function(data) {
							switch (Number(data)) {
							case -1:
								alert("로그인 후 이용해주세요.");
								window.location.href = "/demo/";
								break;
							case 0:
								alert("정상적으로 등록이 되었습니다.");
								window.location.href = "/demo/board_list";
								break;

							default:
								alert("알수없는 오류가 발생했습니다. [ErrorCode : " + Number(data) + "]");
								break;
							}
						},
						error : function(error) {
							alert("오류 발생"+ error);
						}
					});
				});
			});
		</script>
	</body>
</html>