$(document).ready(function(){
	var adminID = "jykim";
	var adminPW = "1234";
	$("#btnLogin").click(function(){
		var uID = $("#userId").val();
		var uPW = $("#passwd").val();
		if (!uID || !uPW) {
			alert("회원 정보를 모두 입력하세요.");
		} else {
			if (uID == adminID) {
				if (uPW == adminPW) {
					alert("로그인 성공");
				} else {
					console.log("비밀번호 불일치");
					alert("회원정보 불일치");
				}
			} else {
				console.log("아이디 불일치");
				alert("회원정보 불일치");
			}
		}
	})
})