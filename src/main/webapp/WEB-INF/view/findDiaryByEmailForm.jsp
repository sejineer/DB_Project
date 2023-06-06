<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>레코드 삽입</title>
</head>
<body>
<p>사용자의 이메일을 통해 해당 사용자가 생성한 다이어리 조회 Query</p>
<form name="form1" method="post" action="${pageContext.request.contextPath}/find-diary-by-email-res">
    <p>유저 이메일 : <input type="text" name="email"></p>
    <p><input type="submit" name="Submit" value="보내기"></p>
</form>
</body>
</html>