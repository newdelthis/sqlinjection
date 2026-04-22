<%@ page import="java.sql.*" %>

<%
String publisher = request.getParameter("publisher");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(
        "jdbc:mysql://db:3306/testdb?useSSL=false&serverTimezone=UTC",
        "root",
        "root"
    );

    stmt = conn.createStatement();

    // INTENTIONALLY VULNERABLE + BROKEN
	String query = "SELECT title, author FROM books WHERE publisher = '" + publisher;
	// Enter this: ' UNION SELECT USERNAME, PASSWORD FROM users 

    out.println("<b>Query:</b> " + query + "<br><br>");

    rs = stmt.executeQuery(query);

    while(rs.next()) {
        out.println(rs.getString("title") + "<br>");
		out.println(rs.getString("author") + "<br>");		
    }

} catch(Exception e) {
    out.println("<b>Error:</b> " + e + "<br>");
}
%>