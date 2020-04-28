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
	<h3>Results for <%=request.getParameter("lineName")%> line on <%=request.getParameter("traveldate")%>:</h3>
	Sort By: <select name="sortBy" id="sortBy" >
				<option onclick="sort(0)" value="0" id ="or">Origin Departure Time</option>
				<option onclick="sort(1)" value="1">Destination Arrival Time</option>
				<option onclick="sort(4)" value="4">Fare</option>
			</select>
	<br>
	
	<%
		try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(
				"SELECT r.reservation_num FROM Reservation r WHERE r.reservation_num = ?"
			);
			String L = request.getParameter("reserveID");
			ps.setString(1, L);
			ResultSet rs = ps.executeQuery();%>
				<table border='1' id="table">
					<tr>
						<th>Reservation ID</th>
						<th></th>
					</tr>
					<%while (rs.next()) {%>
						<tr>
							<td>
								<%=rs.getString("r.reservation_num")%>
							</td>
							<td>
								<form method="get" action="./reserveAdminEdit.jsp">
									<button type="submit">Reserve</button>
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
	
	<form method="get" action="./trainAdmin.jsp">
		<button type="submit">Search another reservation</button>
	</form>
	

</body>
</html>
