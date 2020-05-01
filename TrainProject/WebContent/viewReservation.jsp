
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Reservations</title>
<link href="./zCss/viewReservation.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id = "button2Wrapper">
		<%
		String viewAllQuestions = "<form method=\"get\" action=\"./index.jsp\"><button type=\"submit\" id=\"button2\">BACK</button></form>";
		out.print(viewAllQuestions);
		%>
	</div>
	<div id = "wrapper">
		<div id = "top">
			<div id = "heading">My Reservations</div>
			<div id = "buttonWrapper">
				<% 
				//make search question option
				String searchQuestion = "<form method=\"get\" action=\"./browse.jsp\"><button type=\"submit\" id=\"button\">Browse Train Schedules</button></form>";
				out.print(searchQuestion);
				%>
			</div>
		</div>
		<div id = "tableSquare">
			<div id = "tableText">
			<%
			try{
				//connect to db
				ApplicationDB db = new ApplicationDB();	
				Connection conn = db.getConnection();		
				//get primary key
				String userPK = (String)session.getAttribute("user");
				
				//current 
				java.util.Date utilDate = new java.util.Date();
				// Convert it to java.sql.Date
				java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
				PreparedStatement pst = conn.prepareStatement("SELECT reservation_num, trip, class, fee, origin_station_id,destination_station_id,line_name,train_id,schedule_date,departure_time,seat_number,reservation_date,arrival_time from Reservation where username=? AND schedule_date>=?");
				pst.setString(1, userPK);
				pst.setDate(2, sqlDate);
				ResultSet rs = pst.executeQuery();
				
				out.print("<h3 id=\"heading3\">UPCOMING RESERVATIONS</h3>");
				out.print("<table id=\"table\">");
				
		
				out.print("<tr>");
				
				out.print("<td id=\"A1\">");
				out.print("<b>Res. #</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Type</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Class</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>Price</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>From</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>To</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Line</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>Train</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>Seat</b>");
				out.print("</td>");
				
				out.print("<td id=\"F1\">");
				out.print("<b>Dep. Time</b>");
				out.print("</td>");
				
				out.print("<td id=\"F1\">");
				out.print("<b>Arr. Time</b>");
				out.print("</td>");
				
				out.print("<td id=\"F1\">");
				out.print("<b>Travel Date</b>");
				out.print("</td>");
				
				out.print("<td id=\"A1\">");
				out.print("");
				out.print("</td>");
				
				out.print("</tr>");
				
				
				while (rs.next()) {
					out.print("<tr>");
					String reservationNum = rs.getString("reservation_num");
					
					out.print("<td id=\"A\">");
					out.print(reservationNum);
					out.print("</td>");
					
					out.print("<td id=\"Q\">");
					out.print(rs.getString("trip"));
					out.print("</td>");
					
					out.print("<td id=\"Q\">");
					out.print(rs.getString("class"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("fee"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("origin_station_id"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("destination_station_id"));
					out.print("</td>");
					
					out.print("<td id=\"Q\">");
					out.print(rs.getString("line_name"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("train_id"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("seat_number"));
					out.print("</td>");
					
					out.print("<td id=\"F\">");
					out.print(rs.getString("departure_time"));
					out.print("</td>");
					
					out.print("<td id=\"F\">");
					out.print(rs.getString("arrival_time"));
					out.print("</td>");
					
					out.print("<td id=\"F\">");
					out.print(rs.getString("schedule_date"));
					out.print("</td>");
					
					
					String deleteBtn = "<form method=\"get\" action=\"./deleteReservation.jsp\"><button type=\"submit\" value=\""+reservationNum+"\" name=\"del\" id=\"button3\">Delete</button></form>";
					
					out.print("<td id=\"A\">");
					out.print(deleteBtn);
					out.print("</td>");
					
					out.print("</tr>");
					
				}
				
				out.print("</table>");
				out.print("<br>");
				
				
				//PAST RESERVATIONS
				pst = conn.prepareStatement("SELECT reservation_num, trip, class, fee, origin_station_id,destination_station_id,line_name,train_id,schedule_date,departure_time,seat_number,reservation_date, arrival_time from Reservation where username=? AND schedule_date<?"); 
				pst.setString(1, userPK);
				pst.setDate(2, sqlDate);
				rs = pst.executeQuery();
				
				out.print("<h3 id=\"heading4\">PAST RESERVATIONS</h3>");
				out.print("<table id=\"table\">");
				
		
				out.print("<tr>");
				
				out.print("<td id=\"A1\">");
				out.print("<b>Res. #</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Type</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Class</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>Price</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>From</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>To</b>");
				out.print("</td>");
				
				out.print("<td id=\"Q1\">");
				out.print("<b>Line</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>Train</b>");
				out.print("</td>");
				
				out.print("<td id=\"P1\">");
				out.print("<b>Seat</b>");
				out.print("</td>");
				
				out.print("<td id=\"F1\">");
				out.print("<b>Dep. Time</b>");
				out.print("</td>");
				
				out.print("<td id=\"F1\">");
				out.print("<b>Arr. Time</b>");
				out.print("</td>");
				
				out.print("<td id=\"F1\">");
				out.print("<b>Travel Date</b>");
				out.print("</td>");
				
				out.print("<td id=\"A1\">");
				out.print("");
				out.print("</td>");
				
				out.print("</tr>");
				
				
				while (rs.next()) {
					out.print("<tr>");
					String reservationNum = rs.getString("reservation_num");

					out.print("<td id=\"A\">");
					out.print(reservationNum);
					out.print("</td>");
					
					out.print("<td id=\"Q\">");
					out.print(rs.getString("trip"));
					out.print("</td>");
					
					out.print("<td id=\"Q\">");
					out.print(rs.getString("class"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("fee"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("origin_station_id"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("destination_station_id"));
					out.print("</td>");
					
					out.print("<td id=\"D\">");
					out.print(rs.getString("line_name"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("train_id"));
					out.print("</td>");
					
					out.print("<td id=\"P\">");
					out.print(rs.getString("seat_number"));
					out.print("</td>");
					
					out.print("<td id=\"F\">");
					out.print(rs.getString("departure_time"));
					out.print("</td>");
					
					out.print("<td id=\"F\">");
					out.print(rs.getString("arrival_time"));
					out.print("</td>");
					
					
					out.print("<td id=\"F\">");
					out.print(rs.getString("schedule_date"));
					out.print("</td>");
					
					String deleteBtn = "<form method=\"get\" action=\"./deleteReservation.jsp\"><button type=\"submit\" value=\""+reservationNum+"\" name=\"del\" id=\"button3\">Delete</button></form>";
	
					out.print("<td id=\"A\">");
					out.print(deleteBtn);
					out.print("</td>");
					
					out.print("</tr>");
					
				}
				
				out.print("</table>");
				%>
			</div>
		</div>
	</div>
	
	<%
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
	
		<%
			try {
				//connect to database
				ApplicationDB db = new ApplicationDB();
				Connection conn = db.getConnection();
				String userPK = (String)session.getAttribute("user");
				
				//fetch all reservations from this user that is delayed
		      	PreparedStatement ps = conn.prepareStatement("SELECT reservation_num FROM Reservation WHERE username = ? AND isDelay = true");
				ps.setString(1, userPK);
		      	ResultSet rs = ps.executeQuery();
		      	
		      	//send alert
		      	while(rs.next()){
		      	%>
					<script>
						alert("Reservation #" + <%=rs.getString("reservation_num")%> + " has been delayed.");
					</script>
				<%
		      	}
		      	
		      	//change it back to not delayed
		      	PreparedStatement ps1 = conn.prepareStatement("UPDATE Reservation SET isDelay = 0 WHERE username = ?");
				ps1.setString(1, userPK);
		      	int rs1 = ps1.executeUpdate(); 
		      	
				//close connection
				conn.close();
			} catch(Exception e){
				out.print(e);
			}
		%>
</body>
</html>