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
	<h3>Results for <%=request.getParameter("point")%>:</h3>
	
	<%
		try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(
				"SELECT t.line_name, t.train_id, t.starting_time FROM Train_Schedule t, Arrives a WHERE t.schedule_date = ? AND t.schedule_date = a.schedule_date AND t.starting_time = a.starting_time AND t.line_name = a.line_name AND t.train_id = a.train_id AND a.station_id = ?"
			);
			ps.setString(1, request.getParameter("traveldate"));
			String P = request.getParameter("point");
			ps.setString(2, P);
			ResultSet rs = ps.executeQuery();%>
				<table border='1' id="table">
					<tr>
						<th>Line Name</th>
						<th>Train ID</th>
						<th>Starting Time</th>
						<th></th>
					</tr>
					<%while (rs.next()) {%>
						<tr>
							<td>
								<%=rs.getString("t.line_name")%>
							</td>
							<td>
								<%=rs.getString("t.train_id")%>
							</td>
							<td>
								<%=rs.getString("t.starting_time")%>
							</td>
							<td>
								<form method="get" action="./makeReservation.jsp">
									<button type="submit">EDIT OR DELETE</button>
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
	
	<form method="get" action="./browse.jsp">
		<button type="submit">Search another trip</button>
	</form>
	

</body>
</html>
