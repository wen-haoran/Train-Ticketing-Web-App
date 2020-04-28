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
</head>
<body>
	<h2>Make Reservation</h2>
	<h3>Enter information about your trip</h3>
	
	<form method="get" action="./reservationLogic.jsp">
		<table>
			<tr>
			<td>Trip Type</td><td><select name="trip_type">
			  <option value="one way">One Way</option>
			  <option value="round trip">Round Trip</option>
			  <option value="weekly">Weekly</option>
			  <option value="monthly">Monthly</option>
			</select></td>
			</tr>
			
			<tr>
			<td>Class</td><td><select name="travel_class">
			  <option value="economy">economy</option>
			  <option value="business">Business Class</option>
			  <option value="first">First Class</option>
			</select></td>
			</tr>
			
			<tr>
			<td>Discount</td><td><select name="discounts">
			  <option value="na">N/A</option>
			  <option value="disabled">Disabled</option>
			  <option value="child or elderly">child or elderly</option>
			</select></td>
			</tr>
		</table>
		<input type="submit" value="Reserve">
	</form>
	<%
	String dataStr = request.getParameter("data");
	out.print(dataStr);
	session.setAttribute("infos",dataStr);
	%>
	
</body>
</html>