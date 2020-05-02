<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Browse Train Schedules</title>
<link href="./zCss/browse.css" rel="stylesheet" type="text/css">
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
		<div id = "browseSquare">
			<div id = "browseText">
				<h3>Search schedules by origin to destination:</h3>
				<!--drop down select current origins/destinations in db-->
				<%
				    try{
						ApplicationDB db = new ApplicationDB();
						Connection conn = db.getConnection();
						PreparedStatement ops = conn.prepareStatement("SELECT station_id FROM Station");
						ResultSet ors = ops.executeQuery();
			
						PreparedStatement dps = conn.prepareStatement("SELECT station_id FROM Station");
						ResultSet drs = dps.executeQuery();
				%>
				<form action="./repSchedByODLogic.jsp" class="browse">
					<div class = "browse">
					    Origin Station: <select name="pointA">
						    <%  while(ors.next()){ %>
						        <option><%= ors.getString(1)%></option>
						    <% } %>
					    </select>
					    Destination Station: <select name="pointB">
						    <%  while(drs.next()){ %>
						        <option><%= drs.getString(1)%></option>
						    <% } %>
					    </select>
					</div>
					<br>
					<button type="submit" id = "button" >View Schedules</button>
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
