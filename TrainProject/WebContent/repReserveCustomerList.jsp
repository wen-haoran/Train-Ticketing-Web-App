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
	<h3>Results for <%=request.getParameter("line")%> line on train #<%=request.getParameter("train")%>:</h3>

	
	<%
	String back = "<form method=\"get\" action=\"./repReserveCustomer.jsp\"><button type=\"submit\" id=\"button2\">Back</button></form>";
	out.print(back);
		try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(
				"SELECT c.username FROM Customer c, Reservation r, Train_Schedule t WHERE t.line_name = ? AND t.train_id = ? AND t.line_name = r.line_name AND t.train_id = r.train_id AND r.username = c.username"
			);
			String L = request.getParameter("line");
			ps.setString(1, L);
			String T = request.getParameter("train");
			ps.setString(2, T);
			ResultSet rs = ps.executeQuery();%>
				<table border='1' id="table">
					<tr>
						<th>Customer</th>
					</tr>
					<%while (rs.next()) {%>
						<tr>
							<td>
								<%=rs.getString("c.username")%>
							</td>
						</tr>
					<%}%>
				</table>
			<%conn.close();
		}catch(Exception e){
			System.out.println(e);
		}%>
	
	<form method="get" action="./repReserveCustomer.jsp">
		<button type="submit">Search another train</button>
	</form>
	

</body>
</html>
