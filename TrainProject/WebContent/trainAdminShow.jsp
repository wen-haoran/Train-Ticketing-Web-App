<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<body>
	<form method="get" action="./repIndex.jsp">
		<button type="submit">Home</button>
	</form>
	<p id="demo"></p>
	<h3>Results for <%=request.getParameter("lineName")%> line on <%=request.getParameter("traveldate")%>:</h3>

	
	<%
	String back = "<form method=\"get\" action=\"./trainAdmin.jsp\"><button type=\"submit\" id=\"button2\">Back</button></form>";
	out.print(back);
		try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(
				"SELECT t.line_name, t.train_id, t.starting_time FROM Train_Schedule t WHERE t.schedule_date = ? AND t.line_name = ?"
			);
			ps.setString(1, request.getParameter("traveldate"));
			String L = request.getParameter("lineName");
			ps.setString(2, L);
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
								<form method="get" >
									<button id="reserveCol" type="submit" onclick="getInfo(this)">Reserve</button>
								</form>
							</td>
						</tr>
					<%}%>
				</table>
				<script>
					function getInfo(i){
						alert("row" + i.closest('tr').rowIndex);
					}
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
	
	<form method="get" action="./trainAdmin.jsp">
		<button type="submit">Search another trip</button>
	</form>
	

</body>
</html>
