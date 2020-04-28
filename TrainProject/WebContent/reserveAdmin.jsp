<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Browse Reservations</title>
<link href="./zCss/reserveAdmin.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		//get date
		java.util.Date utilDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	%>
	<div id = "button2Wrapper">
		<%
		String viewAllQuestions = "<form method=\"get\" action=\"./index.jsp\"><button type=\"submit\" id=\"button2\">BACK</button></form>";
		out.print(viewAllQuestions);
		%>
	</div>	
	<div id = "wrapper">
		<div id = "reserveASquare">
			<div id = "reserveAText">
				<h1>pick trip</h1>
				<!--drop down select current origins/destinations in db-->
				<%
				    try{
						ApplicationDB db = new ApplicationDB();
						Connection conn = db.getConnection();
						PreparedStatement line = conn.prepareStatement("SELECT reservation_num FROM Reservation");
						ResultSet lines = line.executeQuery();
				%>
				<form action="./reserveAdminShow.jsp" class="reserveA">
					<div class = "reserveA">
					    Line: <select name="reserveID">
						    <%  while(lines.next()){ %>
						        <option><%= lines.getString(1)%></option>
						    <% } %>
					    </select>
					</div>
					<br>
					<button type="submit" id = "button" >View Reservation</button>
				</form>
				<%}
			        catch(Exception e)
					{
			               out.println(e);
			          }
			  	%>
			</div>
		</div>
	</div>

</body>
</html>
