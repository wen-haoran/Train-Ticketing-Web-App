<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Revenue Report</title>
</head>
<body>
	<h2>Revenue Report</h2>
	
	<%
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		
		int choice_enum = Integer.parseInt(request.getParameter("line/destination/customer"));
		
		PreparedStatement ps;
		ResultSet rs;
		if(choice_enum == 1){//Transit Line
			ps = conn.prepareStatement("SELECT line_name, COALESCE(SUM(fee),0) AS revenue from Reservation group by line_name");
			rs = ps.executeQuery();
			
			out.print("<h3>Transit Line Revenue Report</h3>");
			out.print("<table>");
			out.print("<tr>");
			
			out.print("<td>");
			out.print("Line Name");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Total Revenue");
			out.print("</td>");
			
			out.print("</tr>");
			
			
			while (rs.next()) {
				out.print("<tr>");
				
				out.print("<td>");
				out.print(rs.getString("line_name"));
				out.print("</td>");
				
				out.print("<td>");
				String temp = rs.getString("revenue");
				float temp2 = Float.parseFloat(temp);
				String temp3 = String.format("%.2f", temp2);
				out.print(temp3);
				out.print("</td>");
				
				out.print("</tr>");
			}
			out.print("</table>");
		}else if(choice_enum == 2){//
				ps = conn.prepareStatement("SELECT s.city AS Destination_City, COALESCE(SUM(r.fee),0) AS revenue FROM Reservation r JOIN Station s ON r.destination_station_id = s.station_id GROUP BY s.city");
				rs = ps.executeQuery();
				
				out.print("<h3>Destination City Revenue Report</h3>");
				out.print("<table>");
				out.print("<tr>");
				
				out.print("<td>");
				out.print("Destination City");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Total Revenue");
				out.print("</td>");
				
				out.print("</tr>");
				
				
				while (rs.next()) {
					out.print("<tr>");
					
					out.print("<td>");
					out.print(rs.getString("Destination_City"));
					out.print("</td>");
					
					out.print("<td>");
					String temp = rs.getString("revenue");
					float temp2 = Float.parseFloat(temp);
					String temp3 = String.format("%.2f", temp2);
					out.print(temp3);
					out.print("</td>");
					
					out.print("</tr>");
				}
				out.print("</table>");
		}else if(choice_enum == 3){//
			ps = conn.prepareStatement("SELECT r.username AS username, COALESCE(SUM(r.fee),0) AS revenue FROM Reservation r GROUP BY r.username");
			rs = ps.executeQuery();
			
			out.print("<h3>Customer Username Revenue Report</h3>");
			out.print("<table>");
			out.print("<tr>");
			
			out.print("<td>");
			out.print("Username");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Total Revenue");
			out.print("</td>");
			
			out.print("</tr>");
			
			
			while (rs.next()) {
				out.print("<tr>");
				
				out.print("<td>");
				out.print(rs.getString("username"));
				out.print("</td>");
				
				out.print("<td>");
				String temp = rs.getString("revenue");
				float temp2 = Float.parseFloat(temp);
				String temp3 = String.format("%.2f", temp2);
				out.print(temp3);
				out.print("</td>");
				
				out.print("</tr>");
			}
			out.print("</table>");
		
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