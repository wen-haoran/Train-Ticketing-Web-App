<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>

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
	
	
	<form method="get" action="./reservationLogic.jsp">
		<table>
			<tr>
				<td>type</td><td><select name="type">
			  <option value="one way">One Way</option>
			  <option value="round way">Round Trip</option>
			</select></td>
			</tr>

		</table>
		<input type="submit" value="Reserve">
	</form>
	
</body>
</html>