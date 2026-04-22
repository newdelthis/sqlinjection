<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Secure Search Results</title>
</head>
<body>

<%
String publisher = request.getParameter("publisher");

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(
        "jdbc:mysql://db:3306/testdb?useSSL=false&serverTimezone=UTC",
        "root",
        "root"
    );

    // SECURE QUERY (NO SQL INJECTION)
    String query = "SELECT title, author FROM books WHERE publisher = ?";
    ps = conn.prepareStatement(query);
    ps.setString(1, publisher);

    out.println("<b>Safe Query (PreparedStatement)</b><br><br>");

    rs = ps.executeQuery();

    out.println("<h4>Results for publisher: " + publisher + "</h4>");

    boolean found = false;

    while (rs.next()) {
        found = true;
        out.println(rs.getString("title") + " ..... ");
        out.println(rs.getString("author") + "<br>");
    }

    if (!found) {
        out.println("No results found.");
    }

} catch(Exception e) {
    out.println("<b>Error:</b> " + e);
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(ps != null) ps.close(); } catch(Exception e){}
    try { if(conn != null) conn.close(); } catch(Exception e){}
}
%>

</body>
</html>