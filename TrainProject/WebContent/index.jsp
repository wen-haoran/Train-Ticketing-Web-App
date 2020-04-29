
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Train Website</title>
		<link href="./zCss/index.css" rel="stylesheet" type="text/css">
	</head>
<body>
    <div id = "headings">
        <p id = "name">CHUBBA CHUGGA TRAINS</p>
        <div id = "navigationBar">
          <img src="./ACtrainPic.tiff" id = "gif">
          <div id = "navHyperLink">Choo Choo With Us!</div>    
        </div>
    </div>
    
	<div id = "links">
		<div id = "welcomeText">
			<h1>Welcome</h1>
			<div id = "welcome">
				<% 
				boolean userIsLoggedIn = false;
			 	if (session.getAttribute("user") == null) { 
		    		response.sendRedirect("loginPage.jsp");
				} else { 
					String name = (String)session.getAttribute("first_name");
					out.print("Hello <b>"+ name +"</b>. You are logged in.");
					userIsLoggedIn = true;
				}
				%>
			</div>
		</div>
			  
		<div id = "listOfButtons">
		<% 
		 	if (userIsLoggedIn) { 
				String browseBtn = "<form method=\"get\" action=\"./browse.jsp\"><button type=\"submit\" id=\"button\" >Browse Train Schedules</button></form>";
				out.print(browseBtn);
		
				String viewReserveBtn = "<form method=\"get\" action=\"./viewReservation.jsp\"><button type=\"submit\" id=\"button\">My Reservations</button></form>";
				out.print(viewReserveBtn);
				
				String sendQuestionBtn = "<form method=\"get\" action=\"./zQuestion/sendQuestion.jsp\"><button type=\"submit\" id=\"button\">Ask a Question</button></form>";
				out.print(sendQuestionBtn);
				
				String viewQuestionPage = "<form method=\"get\" action=\"./zQuestion/viewQuestion.jsp\"><button type=\"submit\" id=\"button\">Q&A Page</button></form>";
				out.print(viewQuestionPage);
				
				String logoutBtn = "<form method=\"get\" action=\"./loginPage.jsp\"><button type=\"submit\" id=\"button\"><b>Logout</b></button></form>";
				out.print(logoutBtn);
			}
		%>
		</div>
	</div>			  
</body>
</html>