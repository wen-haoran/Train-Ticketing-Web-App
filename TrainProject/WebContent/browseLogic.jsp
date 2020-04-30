<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Train Schedules</title>
<link href="./zCss/browseLogic.css" rel="stylesheet" type="text/css">
</head>
<body>


	<div id = "wrapper">
	
		<div id = "top">
			<h3 id = "heading">Results for <%=request.getParameter("pointA")%> to <%=request.getParameter("pointB")%> on <%=request.getParameter("traveldate")%>:</h3>
			<div id="sortBy" >
				Sort By: <select name="sortBy">
				<option onclick="sort(0)" value="0" id ="or">Origin Departure Time</option>
				<option onclick="sort(1)" value="1">Destination Arrival Time</option>
				<option onclick="sort(4)" value="4">Fare</option>
				 </select>
			</div>
		</div>
		
		<div id = "tableSquare">
			<div id = "tableText">	
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
							String dateStr = request.getParameter("traveldate");
							
							
							SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
							java.util.Date parsed = format.parse(dateStr);
							java.sql.Date sql = new java.sql.Date(parsed.getTime());
							
							
							ps.setDate(1, sql);
							String B = request.getParameter("pointB");
							ps.setString(2, B);
							String A = request.getParameter("pointA");
							ps.setString(3, A);
							ResultSet rs = ps.executeQuery();%>
								<table border='1'id="table">
									<tr>
										<th id = "Q1">Origin Departure Time</th>
										<th id = "Q1">Destination Arrival Time</th>
										<th id = "Q1">Line Name/Stops</th>
										<th id = "D1">Train ID</th>
										<th id = "D1">Route Fare</th>
										<th id = "D1"></th>
									</tr>
									<%while (rs.next()) {%>
										<tr>
											<td id = "Q">
												<%
												String dTime = rs.getString("d.t_time");
												out.println(dTime);
												%>
											</td>
											<td id = "Q">
												<%
												String aTime = rs.getString("a.t_time");
												out.println(aTime);
												%>
											</td>
											<td id = "Q"> 
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
													if(!stops.contains(temp)){
														stops.add(temp);
														out.println(temp + " ");
													}
												}
												%>
												</small>
											</td>
											<td id = "D">
												<%
												String trainID = rs.getString("t.train_id");
												out.println(trainID);
												
												%>
											</td>
											<td id = "D">
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
											
											<td id = "D">
												<form method="get" action="./makeReservation.jsp">
													<button type="submit" value="<%=str1%>" name="data" id = "button3">Reserve</button>
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
					
					<form method="get" action="./browse.jsp">
						<button id = "button" type="submit">Search Again</button>
					</form>
			</div>
		</div>
	</div>
	
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
