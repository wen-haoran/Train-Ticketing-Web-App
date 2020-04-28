<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
</head>
<body>
	<h2>Select Your Route</h2>

	<form method="get" action="./makeReservation.jsp">
		<table>
			<tr>
			<td>Select your origin station</td><td><select name="origin_station">
			  <option value="NYC Station">NYC Station</option>
			  <option value="New Brunswick Station">New Brunswick Station</option>
			  <option value="DC Station">DC Station</option>
			</select></td>
			</tr>
			
			<tr>
			<td>Select your destination Station</td><td><select name="destination_station">
			  <option value="NYC Station">NYC Station</option>
			  <option value="New Brunswick Station">New Brunswick Station</option>
			  <option value="DC Station">DC Station</option>
			</select></td>
			</tr>
			
		</table>
		<input type="submit" value="Search">
	</form>
	


</body>
</html>