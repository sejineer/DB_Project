<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>레코드 출력</title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td width="100">아이디</td>
			<td width="100">이메일</td>
			<td width="100">이미지URL</td>
			<td width="100">닉네임</td>
			<td width="100">비밀번호</td>
			<td width="100">생성일자</td>
			<td width="100">업데이트일자</td>
			<td width="100">상태</td>
		</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}
	try{
		String jdbcUrl = "jdbc:oracle:thin:@//192.168.219.102:1521/XE";
		String userId = "class_c";
		String userPass = "practice";

		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
		
		String sql = "SELECT * FROM USERS";

		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();
		while( rs.next() ) {
			String id = rs.getString("ID");
			String name = rs.getString("EMAIL");
			String imgUrl = rs.getString("IMAGE_URL");
			String nickname = rs.getString("NICKNAME");
			String password = rs.getString("PASSWORD");
			String createdAt = rs.getString("CREATED_AT");
			String updatedAt = rs.getString("UPDATED_AT");
			String status = rs.getString("STATUS");
%>
			<tr>
				<td width="100"><%= id %></td>
				<td width="100"><%= name %></td>
				<td width="100"><%= imgUrl %></td>
				<td width="100"><%= nickname %></td>
				<td width="100"><%= password %></td>
				<td width="100"><%= createdAt %></td>
				<td width="100"><%= updatedAt %></td>
				<td width="100"><%= status %></td>
			</tr>

<%
		}
	}catch(SQLException e){
		e.printStackTrace();

		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException sqle) {} 
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException sqle) {}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException sqle) {}
		}
	}
%>

	</table>

</body>
</html>