<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.*"%>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make Reservation</title>
<link href="./zCss/makeReservation.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id = "wrapper">
		<div id = "browseSquare">
			<div id = "browseText">
			
			<%
			String travelClass = request.getParameter("travel_class");
			//scheduled date
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date parsed = format.parse(travelDate);
			
			//current date
			java.util.Date utilCurrDate = new java.util.Date();
			// Convert it to java.sql.Date
			
			if(parsed.compare(utilCurrDate) < 0){
				out.print("<p>Error: Your selected trip date is in the past</p>");
				String browseBtn = "<form method=\"get\" action=\"./browse.jsp\"><button id=\"button\" type=\"submit\" id=\"button\">Fina a different trip</button></form>";
				out.print(browseBtn);
				
			}
			%>
				<h2>Make Reservation</h2>
				
				<form method="get" action="./reservationLogic.jsp">
					<table id = "form">
						<tr>
						<td id = "c">Trip Type</td><td id = "c"><select name="trip_type">
						  <option value="one way">One Way</option>
						  <option value="round trip">Round Trip</option>
						  <option value="weekly">Weekly</option>
						  <option value="monthly">Monthly</option>
						</select></td>
						</tr>
						<tr>
						<td id = "c">Class</td><td id = "c"><select name="travel_class">
						  <option value="economy">Economy</option>
						  <option value="business">Business Class</option>
						  <option value="first">First Class</option>
						</select></td>
						</tr>
						<tr>
						<td id = "c1">Discount</td><td id = "c1"><select name="discounts">
						  <option value="na">N/A</option>
						  <option value="disabled">Disabled</option>
						  <option value="child or elderly">Child/Elderly</option>
						</select></td>
						</tr>
					</table>
					<input type="submit" id = "button" value="Continue">
				</form>
				<%
				String dataStr = request.getParameter("data");
				//out.print(dataStr);
				session.setAttribute("infos",dataStr);
				%>
				</div>
		</div>
	</div>
</body>
</html>