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
	<form method="get" action="./repIndex.jsp">
		<button type="submit">Home</button>
	</form>
	<div id = "wrapper">
		<div id = "reserveASquare">
			<div id = "reserveAText">
				<h3>Search reservations by reservation number:</h3>
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
					    Res#: <select name="reserveID">
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
