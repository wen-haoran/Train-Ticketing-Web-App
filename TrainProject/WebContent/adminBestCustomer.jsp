<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best Customer</title>
</head>
<body>
	<h2>Best Customer</h2>
	
	<%
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		
		PreparedStatement ps;
		ResultSet rs;
			//String query = "SELECT t.username AS username, MAX(t.revenue) AS revenue FROM (SELECT r.username username, COALESCE(SUM(r.fee),0) revenue FROM Reservation r GROUP BY r.username) as t";
			String query = "SELECT r.username, COALESCE(SUM(r.fee)) AS revenue FROM Reservation r GROUP BY r.username order by revenue desc limit 1;";
			//String query = "SELECT T.username as username, Max(T.revenue) as MaxVal FROM(SELECT username, COALESCE(SUM(fee), 0) as revenue FROM Reservation GROUP BY username) T GROUP BY username";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()){
				String name = rs.getString("username");
				String temp = rs.getString("revenue");
				float temp2 = Float.parseFloat(temp);
				String temp3 = String.format("%.2f", temp2);
				
				out.print("Best Customer: " + name + " - " + temp3);
			}
		//back button
		String makeReserveBtn = "<form method=\"get\" action=\"./admin.jsp\"><button type=\"submit\">Go back</button></form>";
		out.print(makeReserveBtn);
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>