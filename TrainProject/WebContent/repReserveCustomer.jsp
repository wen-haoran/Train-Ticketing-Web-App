<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Customers by reservation</title>
<link href="./zCss/reserveAdmin.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form method="get" action="./repIndex.jsp">
		<button type="submit">Home</button>
	</form>
	<div id = "wrapper">
		<div id = "reserveASquare">
			<div id = "reserveAText">
				<h3>Search customer by reservations on train and line:</h3>
				<form action="./repReserveCustomerList.jsp" class="reserveA">
					
					<div class="reserveA">
						Line: <input id = "input" type="text" name="line" id="line" onblur="validate()" required>
					</div>
					<div class="reserveA">
						Train ID: <input id = "input" type="number" name="train" id="train" onblur="validate()" required>
					</div>
					<br>
					<button type="submit" id = "button" >View Customers</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
