<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Է� ������</title>

</head>
<body>
<style>
div.name{font-size: 50px;}
div.address{font-size: 50px;}
div.hobby{font-size: 50px;}
</style>
		<form action="parameter02.jsp" method="post">

        <div class = "name">�̸� : <input type="text" name="name" size="30" id="name" style="width:410px;height:100px;font-size:30px;"> </div><br>
        <div class = "address">�ּ� : <input type="text" name="address" size="30" id="address" style="width:410px;height:100px;font-size:30px;"> </div><br>
        <div class = "hobby"> ��� :    <input type="checkbox" name="hobby" value="game" style="width:50px;height:50px;font-size:30px;">����
            <input type="checkbox" name="hobby" value="travel" style="width:50px;height:50px;font-size:30px;">����
            <input type="checkbox" name="hobby" value="reading" style="width:50px;height:50px;font-size:30px;">����
            </div><br>
        <div class = "submit"> <input type="submit" value="����" style="width:100px;height:50px;font-size:30px; background-color : #54ADFF"></div>
		</form>
</body>
</html>