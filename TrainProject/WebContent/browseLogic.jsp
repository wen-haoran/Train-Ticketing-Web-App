<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<body>
	<form method="get" action="./index.jsp">
		<button type="submit">Home</button>
	</form>
	<p id="demo"></p>
	<h3>Results for <%=request.getParameter("pointA")%> to <%=request.getParameter("pointB")%> on <%=request.getParameter("traveldate")%>:</h3>
	Sort By: <select name="sortBy" id="sortBy" >
				<option onclick="sort(0)" value="0" id ="or">Origin Departure Time</option>
				<option onclick="sort(1)" value="1">Destination Arrival Time</option>
				<option onclick="sort(4)" value="4">Fare</option>
			</select>
	<br>
	
	<% 
	String ptA = request.getParameter("pointA");
	String ptB = request.getParameter("pointB");
	session.setAttribute("trip_stationIdA",ptA); 
	session.setAttribute("trip_stationIdB",request.getParameter("pointB")); 
	session.setAttribute("trip_travelDate",request.getParameter("traveldate")); 
	String[] tripDataArray = new String[5];
	%>
	
	<%
		try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(
				"SELECT d.t_time, a.t_time, t.line_name, t.train_id FROM Train_Schedule t, Departs d, Arrives a WHERE t.schedule_date = ? AND t.schedule_date = a.schedule_date AND t.starting_time = a.starting_time AND t.line_name = a.line_name AND t.train_id = a.train_id AND a.station_id = ? AND t.schedule_date = d.schedule_date AND t.starting_time = d.starting_time AND t.line_name = d.line_name AND t.train_id = d.train_id AND d.station_id = ? AND d.t_time < a.t_time"
			);
			ps.setString(1, request.getParameter("traveldate"));
			String B = request.getParameter("pointB");
			ps.setString(2, B);
			String A = request.getParameter("pointA");
			ps.setString(3, A);
			ResultSet rs = ps.executeQuery();%>
				<table border='1' id="table">
					<tr>
						<th>Origin Departure Time</th>
						<th>Destination Arrival Time</th>
						<th>Line Name/Stops</th>
						<th>Train ID</th>
						<th>Route Fare</th>
						<th></th>
					</tr>
					<%while (rs.next()) {%>
						<tr>
							<td>
								<%
								String dTime = rs.getString("d.t_time");
								out.println(dTime);
								%>
							</td>
							<td>
								<%
								String aTime = rs.getString("a.t_time");
								out.println(aTime);
								%>
							</td>
							<td id="ln"> 
								<%
								String ln = rs.getString("t.line_name");
								out.println(ln);
								%>
								<br>
								<small>
								<!-- Finding all stops in the line (in order) -->
								<%
								PreparedStatement ps2 = conn.prepareStatement("SELECT s.station_id FROM Departs d, Train_Schedule t, Station s WHERE t.line_name=? AND t.line_name=d.line_name AND t.starting_time=d.starting_time AND t.schedule_date=d.schedule_date AND t.train_id=d.train_id AND d.station_id=s.station_id ORDER BY d.t_time ASC");
								ps2.setString(1, ln);
								ResultSet rs2 = ps2.executeQuery();
								ArrayList<String> stops = new ArrayList<String>();
								String temp;
								while(rs2.next()){
									temp = rs2.getString("s.station_id");
									stops.add(temp);
									out.println(temp + " ");
								}
								%>
								</small>
							</td>
							<td>
								<%
								String trainID = rs.getString("t.train_id");
								out.println(trainID);
								
								%>
							</td>
							<td>
								<!-- Finding fare of line and calculating base pay -->
								<%
								PreparedStatement ps3 = conn.prepareStatement("SELECT route_fare FROM Fare WHERE line_name = ?");
								ps3.setString(1, ln);
								ResultSet rs3 = ps3.executeQuery();
								rs3.next();
								int i;
								for(i = stops.indexOf(A); i < stops.size(); i++){
									if(B.equals(stops.get(i))){
										break;
									}
								}
								float fare = rs3.getFloat("route_fare")*i;
								out.println(fare);
								%>
							</td>
							<% 
							tripDataArray[0] = dTime;
							tripDataArray[1] = aTime;
							tripDataArray[2] = ln;
							tripDataArray[3] = trainID;
							tripDataArray[4] = Float.toString(fare);
							String str1 = Arrays.toString(tripDataArray);
							
							%>
							
							<td>
								<form method="get" action="./makeReservation.jsp">
									<button type="submit" value="<%=str1%>" name="data">Reserve</button>
								</form>
							</td>
						</tr>
					<%}%>
				</table>
				<script>
				    function sort(j) { 
				        var table, i, x, y; 
				        table = document.getElementById("table"); 
				        var switching = true; 
				
				        while (switching) { 
				            switching = false; 
				            var rows = table.rows; 
				            
				            for (i = 1; i < (rows.length - 1); i++) { 
				                var makeSwitch = false; 
				                x = rows[i].getElementsByTagName("TD")[j]; 
				                y = rows[i + 1].getElementsByTagName("TD")[j]; 
				
				                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()){ 
				                    makeSwitch = true; 
				                    break; 
				                } 
				            } 
				            if (makeSwitch) { 
				                // Function to switch rows and mark switch as completed 
				                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]); 
				                switching = true; 
				            } 
				        } 
				    } 
				</script>
			<%conn.close();
		}catch(Exception e){
			System.out.println(e);
		}%>
	
	<p><small>50% off for seniors/children/persons with disabilities</small></p>
	<p><small>Save now by purchasing a weekly or monthly pass!</small></p>
	<br>
	
	<form method="get" action="./browse.jsp">
		<button type="submit">Search another trip</button>
	</form>
	

</body>
</html>