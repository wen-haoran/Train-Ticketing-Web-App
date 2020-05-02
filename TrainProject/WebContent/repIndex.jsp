<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Rep</title>
	</head>
<body>
	<div id = "links">
		<div id = "welcomeText">
			<h3>Welcome Customer Representative!</h3>
			<div id = "welcome">
				<% 
				boolean userIsLoggedIn = false;
			 	if (session.getAttribute("user") == null) { 
		    		response.sendRedirect("loginPage.jsp");
				} else { 
					out.print("You are logged in.");
					userIsLoggedIn = true;
				}
				%>
			</div>
		</div>
			  
		<div id = "listOfButtons">
		<% 
		 	if (userIsLoggedIn) { 
				String repStationScheds = "<form method=\"get\" action=\"./repSchedByStation.jsp\"><button type=\"submit\" id=\"button\">View Schedules by Station</button></form>";
				out.print(repStationScheds);
				String repODScheds = "<form method=\"get\" action=\"./repSchedByOD.jsp\"><button type=\"submit\" id=\"button\">View Schedules from Origin to Destination</button></form>";
				out.print(repODScheds);
				String trainA = "<form method=\"get\" action=\"./trainAdmin.jsp\"><button type=\"submit\" id=\"button\">View Schedules by Line</button></form>";
				out.print(trainA);
				String repAddSched = "<form method=\"get\" action=\"./repAddSched.jsp\"><button type=\"submit\" id=\"button\">Add a Train Schedule</button></form>";
				out.print(repAddSched);
				String reserveA = "<form method=\"get\" action=\"./reserveAdmin.jsp\"><button type=\"submit\" id=\"button\">View Reservations</button></form>";
				out.print(reserveA);
				String reserveB = "<form method=\"get\" action=\"./reserveAdd.jsp\"><button type=\"submit\" id=\"button\">Add a reservation</button></form>";
				out.print(reserveB);
				String reserveC = "<form method=\"get\" action=\"./repReserveCustomer.jsp\"><button type=\"submit\" id=\"button\">View Customers by Train/Line reservation</button></form>";
				out.print(reserveC);
				String question = "<form method=\"get\" action=\"./repAnswerQuestion.jsp\"><button type=\"submit\" id=\"button\">Answer Customer Questions</button></form>";
				out.print(question);
				String logoutBtn = "<form method=\"get\" action=\"./loginPage.jsp\"><button type=\"submit\" id=\"button\"><b>Logout</b></button></form>";
				out.print(logoutBtn);
			}
		%>
		</div>
	</div>			  
</body>
</html>
