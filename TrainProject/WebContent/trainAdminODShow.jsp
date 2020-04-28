<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<body>
	<%
		//get date
		java.util.Date utilDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	%>
	<form method="get" action="./index.jsp">
		<button type="submit">Home</button>
	</form>
	<p id="demo"></p>
	<h3>Results for <%=request.getParameter("pointA")%> to <%=request.getParameter("pointB")%> on <%=request.getParameter("traveldate")%>:</h3>

	<br>
	
	<%
		try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(
				"SELECT t.line_name, t.train_id, t.starting_time FROM Train_Schedule t, Departs d, Arrives a WHERE t.schedule_date = ? AND t.schedule_date = a.schedule_date AND t.starting_time = a.starting_time AND t.line_name = a.line_name AND t.train_id = a.train_id AND a.station_id = ? AND t.schedule_date = d.schedule_date AND t.starting_time = d.starting_time AND t.line_name = d.line_name AND t.train_id = d.train_id AND d.station_id = ? AND d.t_time < a.t_time"
			);
			ps.setString(1, request.getParameter("traveldate"));
			String B = request.getParameter("pointB");
			ps.setString(2, B);
			String A = request.getParameter("pointA");
			ps.setString(3, A);
			ResultSet rs = ps.executeQuery();%>
				<table border='1' id="table">
					<tr>
						<th>Line Name/Stops</th>
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
