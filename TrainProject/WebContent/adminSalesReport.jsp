<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Monthly Sales Report</title>
</head>
<body>
	<h2>Monthly Sales Report</h2>
	
	<%
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		int month = Integer.parseInt(request.getParameter("month"));
		
		PreparedStatement pst = conn.prepareStatement("SELECT COALESCE(SUM(fee), 0) AS Revenue FROM Reservation WHERE MONTH(reservation_date) = ?");
		pst.setInt(1, month);
		
		ResultSet rs = pst.executeQuery();
		//String revenue = rs.getString("Revenue");
		if(rs.first()){
			String temp = rs.getString("Revenue");
			float temp2 = Float.parseFloat(temp);
			String temp3 = String.format("%.2f", temp2);
			
			out.print("$" + temp3);
			String returnButton = "<form action=\"./admin.jsp\"><button type=\"submit\">Go back</button></form>";
			out.println(returnButton);
 		} 
/* 		else{
			out.print("No reservations were in this month");
			String returnButton = "<form action=\"./admin.jsp\"><button type=\"submit\">Try again</button></form>";
			out.println(returnButton);
		}  */
	
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>