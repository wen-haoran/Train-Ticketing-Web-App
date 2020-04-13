<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	This is a testing page for making a reservation
	part 2
	Origin 
	Destionation 
	date of Travel 
	<%
	//station info
	int station_id1 = 1
	String stationName1 = "New Brunswick Station"
	String state1 = "NJ"
	String city1 = "New Brunswick"
	
	int station_id2 = 2
	String stationName2 = "NYC Station"
	String state2 = "NY"
	String city2 = "NYC"
	
	//Orgin
	departTime = 
	
	//Destination
			
	
	String makeReserveBtn = "<form method=\"get\" action=\"./makeReservation.jsp\"><button type=\"submit\">Make Reservations</button></form>";
	out.print(makeReserveBtn);
	%>

</body>
</html>