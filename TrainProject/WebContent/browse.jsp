<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/HwenAaron/CS336Trains.git
<!DOCTYPE html>
<html>
<body>
	<form method="get" action="./index.jsp">
		<button type="submit">Home</button>
	</form>

	<h1>Plan your trip today!</h1>
	<!--drop down select current origins/destinations in db-->
	<%
	    try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
<<<<<<< HEAD
			PreparedStatement ops = conn.prepareStatement("SELECT origin FROM Line");
=======
			PreparedStatement ops = conn.prepareStatement("SELECT station_id FROM Station");
>>>>>>> branch 'master' of https://github.com/HwenAaron/CS336Trains.git
			ResultSet ors = ops.executeQuery();

<<<<<<< HEAD
			PreparedStatement dps = conn.prepareStatement("SELECT destination FROM Line");
=======
			PreparedStatement dps = conn.prepareStatement("SELECT station_id FROM Station");
>>>>>>> branch 'master' of https://github.com/HwenAaron/CS336Trains.git
			ResultSet drs = dps.executeQuery();
	%>
	<form action="./browseLogic.jsp" class="browse">
		<div class = "browse">
<<<<<<< HEAD
		    Origin Station: <select name="origin">
			    <%  while(ors.next()){ 
			       out.print("<option>"+ors.getString("origin")+"</option>");
			    } %>
=======
		    Origin Station: <select name="pointA">
			    <%  while(ors.next()){ %>
			        <option><%= ors.getString(1)%></option>
			    <% } %>
>>>>>>> branch 'master' of https://github.com/HwenAaron/CS336Trains.git
		    </select>
			<br>
		    Destination Station: <select name="pointB">
			    <%  while(drs.next()){ %>
			        <option><%= drs.getString(1)%></option>
			    <% } %>
		    </select>
			<br>
			Date of Travel: <input type="date" name="traveldate" id="traveldate" value="0000-00-00" required>
			<br>
			Sort By: <select name="sortBy">
					<option value="d.time">Origin Departure Time</option>
					<option value="a.time">Destination Arrival Time</option>
					<option value="fareSB">Fare</option>
			</select>
		</div>
		<br>
		<button type="submit">View Schedule</button>
	</form>
<<<<<<< HEAD
	<%
	//add station ids for reference?
	
	    }
=======
	<%}
>>>>>>> branch 'master' of https://github.com/HwenAaron/CS336Trains.git
        catch(Exception e)
		{
               out.println(e);
          }
  	%>


	<form method="get" action="./makeReservation.jsp">
		<button type="submit">Reserve your trip here!</button>
	</form>
</body>
</html>
