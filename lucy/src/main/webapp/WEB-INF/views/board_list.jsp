<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>게시글 작성 데모</title>
</head>

<body>
    <h3>## 게시글 목록 페이지 ##</h3>
    <a href="/demo/board_wrtie">게시글 작성하기</a>

    <table border="1">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">등록일</th>
            </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>


    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function() {
            $.ajax({
                type: "GET",
                url: "get_board",
                success: function(data) {
                    //12번 눌러서 콘솔로 이동하면 json형태의 데이터 확인
                    console.log(data);

                    //데이터의 크기만큼 돌려줌
                    for (var str in data) {
                        //tr 태그를 생성해서 id에 tobody에 추가
                        var tr = $("<tr></tr>").appendTo("#tbody");
                        //tr에 td를 추가 후 내용을 데이터 값
                        $("<td></td>").text(data[str]['b_no']).appendTo(tr);
                        $("<td></td>").text(data[str]['b_title']).appendTo(tr);
                        $("<td></td>").text(data[str]['b_owner_nick']).appendTo(tr);
                        $("<td></td>").text(FormatToUnixtime(data[str]['b_regdate'])).appendTo(tr);
                    }
                },
                error: function(error) {
                    alert("오류 발생" + error);
                }
            });
			
            //유닉스 타임스템프를 년 월 일 시 분 초로 변경하기 위한 함수
            function FormatToUnixtime(unixtime) {
            	var u = new Date(unixtime);
                return u.getUTCFullYear() +
                    '-' + ('0' + u.getUTCMonth()).slice(-2) +
                    '-' + ('0' + u.getUTCDate()).slice(-2) +
                    ' ' + ('0' + u.getUTCHours()).slice(-2) +
                    ':' + ('0' + u.getUTCMinutes()).slice(-2) +
                    ':' + ('0' + u.getUTCSeconds()).slice(-2)
            };
        });

    </script>
</body>

</html>
