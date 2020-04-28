<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationLogic</title>
</head>
<body>

	<% 
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
	
	
	//final fare out.print(netFare);
	   

	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		//get username and password
		
		//travel date
		java.util.Date utilTravelDate = new SimpleDateFormat("yyyy-mm-dd").parse(travelDate); 
		// Convert it to java.sql.Date
		java.sql.Date sqlTravelDate = new java.sql.Date(utilTravelDate.getTime());

		//current date
		java.util.Date utilCurrDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlCurrDate = new java.sql.Date(utilCurrDate.getTime());
		
		
		//convert time
		java.util.Date utilTime = new SimpleDateFormat("hh:mm:ss").parse(aTime); 
		// Convert it to java.sql.Date
		java.sql.Time sqlTime = new java.sql.Time(utilTime.getTime());

		
		PreparedStatement pst = conn.prepareStatement("INSERT INTO Reservation(trip,class,discount,fee,origin_station_id,destination_station_id,line_name,train_id,schedule_date,departure_time,seat_number,reservation_date,username) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1, tripType);
		pst.setString(2, travelClass);
		pst.setString(3, discountGroup);
		pst.setFloat(4, (float)netFare);
		pst.setString(5, stationID_A);
		pst.setString(6, stationID_B);
		pst.setString(7, lineName);
		pst.setString(8, trainID);
		pst.setDate(9, sqlTravelDate);
		pst.setTime(10, sqlTime);
		//seat number
		pst.setString(11, "11");
		pst.setDate(12, sqlCurrDate);
		pst.setString(13, userPK);		
		
		//execute the sql query
		int result = pst.executeUpdate();
		out.print("Reservation table updated.");
			
		String makeReserveBtn = "<form method=\"get\" action=\"./index.jsp\"><button type=\"submit\">Search and >Back to Home</button></form>";
		out.print(makeReserveBtn);
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>