<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top 5 Most Active Lines</title>
</head>
<body>
	<h2>Top 5 Most Active Lines</h2>
	
	<%
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		//query the db with input data
		PreparedStatement pst = conn.prepareStatement("SELECT line_name, count(*) AS cnt FROM Reservation GROUP BY line_name ORDER BY cnt DESC LIMIT 5");
		//execute the sql query
		ResultSet rs = pst.executeQuery();
		
		out.print("<ol>");
		while(rs.next()){
			out.print("<li>");
			out.print(rs.getString("line_name"));
			out.print("</li>");
		}
		out.print("</ol>");
		
		String s = "<form method=\"get\" action=\"./admin.jsp\"><button type=\"submit\"  id=\"button\">Back to admin</button></form>";
		out.print(s);
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>