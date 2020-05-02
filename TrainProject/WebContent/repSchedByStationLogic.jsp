<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head><title>Schedules</title></head>
<body>
	<form method="get" action="./repIndex.jsp">
		<button type="submit">Home</button>
	</form>
	<p id="demo"></p>
	<h3>Results for station <%=request.getParameter("point")%>:</h3>
	
	<%
	String back = "<form method=\"get\" action=\"./repSchedByStation.jsp\"><button type=\"submit\" id=\"button2\">Back</button></form>";
	out.print(back);
	
		try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(
				"SELECT t.line_name, t.train_id, t.starting_time, t.schedule_date, t.travel_time FROM Train_Schedule t, Schedule_Stop a WHERE t.schedule_date = a.schedule_date AND t.starting_time = a.starting_time AND t.line_name = a.line_name AND t.train_id = a.train_id AND a.station_id = ?"
			);
			String P = request.getParameter("point");
			ps.setString(1, P);
			ResultSet rs = ps.executeQuery();%>
				<table border='1' id="table">
					<tr>
						<th>Line Name</th>
						<th>Train ID</th>
						<th>Starting Time</th>
						<th>Schedule Date</th>
						<th></th>
						<th></th>
					</tr>
					<%while (rs.next()) {
					%>
						<tr>
							<td>
								<%String a = rs.getString("t.line_name");
								out.print(a);%>
							</td>
							<td>
								<%String b = rs.getString("t.train_id");
								out.print(b);%>
							</td>
							<td>
								<%String c = rs.getString("t.starting_time");
								out.print(c);%>
							</td>
							<td>
								<%String d = rs.getString("t.schedule_date");
								out.print(d);%>
							</td>
							<td>
								<form method="get" action="./repEditSched.jsp">
									<input type="hidden" type="text" name="linep" id="linep" value = "<%=a%>">
									<input type="hidden" type="text" name="trainp" id="trainp" value = "<%=b%>">
									<input type="hidden" type="time" name="startTimep" id="startTimep" value = "<%=c%>">
									<input type="hidden" type="date" name="travelDatep" id="travelDatep" value = "<%=d%>">
									<input type="hidden" type="time" name="travelTimep" id="travelTimep" value = "<%=rs.getString("t.travel_time")%>">
									<button type="submit">EDIT</button>
								</form>
							</td>
							<td>
								<form method="get" action="./repDeleteSched.jsp">
									<input type="hidden" type="text" name="line" id="line" value = "<%=a%>">
									<input type="hidden" type="text" name="train" id="train" value = "<%=b%>">
									<input type="hidden" type="time" name="startTime" id="startTime" value = "<%=c%>">
									<input type="hidden" type="date" name="travelDate" id="travelDate" value = "<%=d%>">
									<button type="submit">DELETE</button>
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
	
	<br>
	
	<form method="get" action="./repSchedByStation.jsp">
		<button type="submit">Search another trip</button>
	</form>
	

</body>
</html>
