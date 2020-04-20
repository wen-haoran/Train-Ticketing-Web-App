<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<body>
	<form method="get" action="./index.jsp">
		<button type="submit">Home</button>
	</form>
	<%
	//ADD ARRIVAL&DEPARTURE TIME
		try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT origin, destination, route_fare
														FROM Line, Fare
														WHERE origin = ?
														AND destination = ?
														AND date in(SELECT date
																	FROM Train_Schedule t
																		Line l
																	WHERE t.line = l.Line
																	AND date = ?)
														ORDER BY sortBy = ?");
			ps.setString(1, request.getParameter("origin"));
			ps.setString(2, request.getParameter("destination"));
			ps.setString(3, request.getParameter("date"));
			ps.setString(4, request.getParameter("sortBy"));

			out.print("<table>");
				out.print("<tr>");
					out.print("<td>");
						out.print("Origin");
					out.print("</td>");
					out.print("<td>");
						out.print("Destination");
					out.print("</td>");
					out.print("<td>");
						out.print("Arrival Time");
					out.print("</td>");
					out.print("<td>");
						out.print("Destination Time");
					out.print("</td>");
					out.print("<td>");
						out.print("Fare");
					out.print("</td>");
				out.print("</tr>");

				while (rs.next()) {
					out.print("<tr>");
						out.print("<td>");
							out.print(rs.getString("origin"));
						out.print("</td>");
						out.print("<td>");
							out.print(rs.getString("destination"));
						out.print("</td>");
						/*out.print("<td>");
							out.print(rs.getString("departTime"));
						out.print("</td>");
						out.print("<td>");
							out.print(rs.getString("arriveTime"));
						out.print("</td>");*/
						out.print("<td>");
							out.print(rs.getString("route_fare"));
						out.print("</td>");
					out.print("</tr>");
				}
			out.print("</table>");

			conn.close();
		}catch(Exception e){
			System.out.println(e);
		}
	%>
	<form method="get" action="./browse.jsp">
		<button type="submit">Search another trip</button>
	</form>
	<form method="get" action="./makeReservation.jsp">
		<button type="submit">Reserve your trip here!</button>
	</form>

</body>
</html>
