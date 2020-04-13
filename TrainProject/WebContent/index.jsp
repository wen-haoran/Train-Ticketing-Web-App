<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Train Website</title>
	</head>
<body>
	<h1>Home Page</h1>
	 <% 
	 	if (session.getAttribute("user") == null) { 
    		response.sendRedirect("loginPage.jsp");
		} else { 
			String name = (String)session.getAttribute("first_name");
			out.print("Hello "+ name +"<br>You are logged ln");
			
			String viewReserveBtn = "<form method=\"get\" action=\"./viewReservation.jsp\"><button type=\"submit\">View My Reservations</button></form>";
			out.print(viewReserveBtn);

			String makeReserveBtn = "<form method=\"get\" action=\"./makeReservation.jsp\"><button type=\"submit\">Search and Make Reservation</button></form>";
			out.print(makeReserveBtn);
			
			String logoutBtn = "<form method=\"get\" action=\"./loginPage.jsp\"><button type=\"submit\">Logout</button></form>";
			out.print(logoutBtn);
		}
	%>
	
			  
</body>
</html>