<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
   <head>
      <title>Display Current Date & Time</title>
   	    <script type = "text/javascript">
            function TrainFull() {
               alert ("Train is full Please select another trip!");
               document.write ("Train is full. Please select another trip!");
            }
      </script>
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
	String dTime = tripDataArr[0].trim();
	String aTime= tripDataArr[1].trim();
	String trainID= tripDataArr[3].trim();
	String lineName= tripDataArr[2].trim();
	float baseFare= Float.parseFloat(tripDataArr[4].trim());
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
		netFare *= 1;
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
		
		//getSeat number 
		String s1 = "01";
		PreparedStatement ps = conn.prepareStatement("SELECT * from Trains where train_id = ?");
		ps.setString(1, trainID);
		ResultSet rs = ps.executeQuery();
		int seatNum = 0;
		String seatNumStr = "";
		while(rs.next()){
			seatNum = rs.getInt("number_of_seats");
			seatNumStr = String.valueOf(seatNum);
			out.print("rs works so far");
		}
		
		if(trainID.equals(s1)){
			out.print("LOL");
		}
		
		/*
		//update seats in train
		PreparedStatement psU = conn.prepareStatement("UPDATE Trains SET number_of_seats = ? WHERE train_id = ?");
		psU.setInt(1,seatNum);
		psU.setString(2, trainID);
		int result1 = psU.executeUpdate();
		*/
		out.print("end of file");
		
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
   
   
   %>
   </body>