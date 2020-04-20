<!DOCTYPE html>
<html>
<body>
	<form method="get" action="./index.jsp">
		<button type="submit">Home</button>
	</form>

	<h1>Plan your trip today!</h1>
	<!--drop down select origin/destination and enter date-->
	<%
	    try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
			PreparedStatement ops = conn.prepareStatement("SELECT origin FROM Line);
			ResultSet ors = ops.executeQuery();

			PreparedStatement dps = conn.prepareStatement("SELECT destination FROM Line);
			ResultSet drs = dps.executeQuery();
	%>
	<form action="./browseLogic" class="browse">
		<div class = "browse">
		    Origin Station: <select name="origin">
			    <%  while(ors.next()){ %>
			        <option><%= ors.getString(1)%></option>
			    <% } %>
		    </select>
			<br>
		    Destination Station: <select name="destination">
			    <%  while(drs.next()){ %>
			        <option><%= drs.getString(1)%></option>
			    <% } %>
		    </select>
			<br>
			Date of Travel: <input type="date" name="traveldate" id="traveldate" required>
			<br>
			Sort By: <select name="sortBy">
					<option value="arrivalSB">Arrival Time</option>
					<option value="departureSB">Departure Time</option>
					<option value="originSB">Origin</option>
					<option value="destinationSB">Destination</option>
					<option value="fareSB">Fare</option>
			</select>
		</div>
		<br>
		<button type="submit">View Schedule</button>
	</form>
	//add station ids for reference?
	<%}
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
