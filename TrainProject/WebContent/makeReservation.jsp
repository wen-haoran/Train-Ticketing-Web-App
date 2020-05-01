<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.*"%>
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
			String travelDate = (String)session.getAttribute("trip_travelDate");
			//scheduled date
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date parsed = format.parse(travelDate);
			
			//current date
			java.util.Date utilCurrDate = new java.util.Date();
			// Convert it to java.sql.Date
			
			if(parsed.compareTo(utilCurrDate) > 0){
				%>
				<script>
		        	alert("Can not reserve a trip from the past. Please reserve another trip.");
		         	window.location = "./browse.jsp";
		     	</script>
		     <%
			}
			%>
				<h2>Make Reservation</h2>
				
				<form method="get" action="./reservationLogic.jsp">
					<table id = "form">
						<tr>
						<td id = "c">Trip Type</td><td id = "c"><select name="trip_type">
						  <option value="one way">One Way</option>
						  <option value="round trip">Round Trip</option>
						</select></td>
						</tr>
						<tr>
						<td id = "c">Pass</td><td id = "c"><select name="pass_type">
						  <option value="na">N/A</option>
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