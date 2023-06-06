<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>레코드 삽입</title>
</head>
<body>

<table width="500" border="1">
    <tr>
        <td width="100">아이디</td>
        <td width="150">제목</td>
        <td width="150">내용</td>
        <td width="100">일기 날짜</td>
        <td width="100">일기 이미지 URL</td>
        <td width="100">생성일자</td>
        <td width="100">업데이트일자</td>
        <td width="100">상태</td>
    </tr>
    <%
        request.setCharacterEncoding("utf-8");

        String reqUserId = request.getParameter("userId");
        String reqDiaryId = request.getParameter("diaryId");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        }catch(ClassNotFoundException cnfe){
            cnfe.printStackTrace();
            System.out.println("드라이버 로딩 실패");
        }
        try {
            String jdbcUrl = "jdbc:oracle:thin:@//192.168.219.102:1521/XE";
            String userId = "class_c";
            String userPass = "practice";

            conn = DriverManager.getConnection(jdbcUrl, userId, userPass);

            String sql = "SELECT r.* FROM RECORD r" +
                    " JOIN DIARY d ON r.DIARY_ID = d.ID" +
                    " JOIN USER_DIARY ud ON d.ID = ud.DIARY_ID" +
                    " JOIN USERS u ON ud.USER_ID = u.ID" +
                    " WHERE u.ID = ? AND d.ID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(reqUserId));
            pstmt.setInt(2, Integer.parseInt(reqDiaryId));

            rs = pstmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ID");
                String name = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                String recordDate = rs.getString("RECORD_DATE");
                String imageUrl = rs.getString("IMAGE_URL");
                String createdAt = rs.getString("CREATED_AT");
                String updatedAt = rs.getString("UPDATED_AT");
                String status = rs.getString("STATUS");

    %>
    <tr>
        <td width="100"><%= id %></td>
        <td width="150"><%= name %></td>
        <td width="150"><%= content %></td>
        <td width="150"><%= recordDate %></td>
        <td width="100"><%= imageUrl %></td>
        <td width="100"><%= createdAt %></td>
        <td width="100"><%= updatedAt %></td>
        <td width="100"><%= status %></td>
    </tr>


    <%
            }

        }catch(SQLException e){
            e.printStackTrace();

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
