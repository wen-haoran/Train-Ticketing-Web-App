<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
   <head>
      <title>Display Current Date & Time</title>
   </head>
   
   <body>
   <%
   /*
   String a = (String)session.getAttribute("infos"); 
   //out.print(a);
   String str = a.substring(1, a.length()-1);
   String[] tripDataArr = new String[5];
	
   // delimiter 
   String delimiter = ",";

   // given string will be split by the argument delimiter provided. 
   tripDataArr = str.split(delimiter);
   
   float f = Float.parseFloat(tripDataArr[4]);
   f= f*2;
   out.print(f);
   
   
   */
   //*******************
   
   //Reterving information from browse and make reservation jsps
	String a = (String)session.getAttribute("infos"); 
	//out.print(a);
	String str = a.substring(1, a.length()-1);
	String[] tripDataArr = new String[5];
	/* delimiter */
	String delimiter = ",";
	/* given string will be split by the argument delimiter provided. */
	tripDataArr = str.split(delimiter);
	String dTime = tripDataArr[0];
	String aTime= tripDataArr[1];
	String trainID= tripDataArr[3];
	String lineName= tripDataArr[2];
	float baseFare= Float.parseFloat(tripDataArr[4]);
	String stationID_A = (String)session.getAttribute("trip_stationIdA");
	String stationID_B = (String)session.getAttribute("trip_stationIdB"); 
	String travelDate = (String)session.getAttribute("trip_travelDate");
	String userPK = (String)session.getAttribute("user");
	String tripType = request.getParameter("trip_type");
	String travelClass = request.getParameter("travel_class");
	String discountGroup = request.getParameter("discounts");
	//parsing discount
	double netFare = baseFare;
	
	if(travelClass.equals("first")){
		netFare += 20;
	}else if(travelClass.equals("business")){
		netFare += 15;
	}else if(travelClass.equals("economy")){
		netFare += 10;
	}
	
	if (tripType.equals("one way")){
		netFare *= 1;
	}else if(tripType.equals("round trip")){
		netFare *= 2;
	}else if(tripType.equals("weekly")){
		netFare *= .95;
	}else if(tripType.equals("monthly")){
		netFare *= .9;
	}

	if(discountGroup.equals("na")){
		netFare *= 1;
	}else{
		netFare *= 0.5;
	}
	
	out.print(netFare);
   
   
   %>
   </body>