<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>레코드 삽입</title>
</head>
<body>
<p>특정 사용자가 작성한 일기 조회 Query</p>
<form name="form1" method="post" action="${pageContext.request.contextPath}/find-record-res">
    <p>유저 아이디 : <input type="text" name="id"></p>
    <p><input type="submit" name="Submit" value="보내기"></p>
</form>
</body>
</html>