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
	<h3>Results for Reservation #<%=request.getParameter("reserveID")%></h3>

	
	<%
	String back = "<form method=\"get\" action=\"./reserveAdmin.jsp\"><button type=\"submit\" id=\"button2\">Back</button></form>";
	out.print(back);
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
						<th></th>
					</tr>
					<%while (rs.next()) {%>
						<tr>
							<td>
								<% String s = rs.getString("r.reservation_num");
								out.println(s);%>
							</td>
							<td>
								<form method="get" action="./reserveEdit.jsp">
									<button type="submit" value="<%=s%>" name="edit">Edit</button>
								</form>
							</td>
							<td>
								<form method="get" action="./reserveAdminDelete.jsp">
									<button type="submit" value="<%=s%>" name="del">Delete</button>
									
								</form>
							</td>
						</tr>
					<%}%>
				</table>
			<%conn.close();
		}catch(Exception e){
			System.out.println(e);
		}%>
	
	<form method="get" action="./reserveAdmin.jsp">
		<button type="submit">Search another reservation</button>
	</form>
	

</body>
</html>
