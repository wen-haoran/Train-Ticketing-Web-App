<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success!</title>
<link href="./zCss/reservationLogic.css" rel="stylesheet" type="text/css">
	<script type = "text/javascript">
            function funcWarn() {
               alert ("Train is full. Please select another route!");
               document.write ("Train is full. Please select another route!");
            }
            function funcRT(){
          		alert ("Please select your return trip!");
            	document.write ("Please select your return trip!");
            }
      </script>
</head>
<body>

	<div id = "alertSquare">
		<div id = "alertText">
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
	float baseFare= Float.parseFloat(tripDataArr[4]);
	String stationID_A = (String)session.getAttribute("trip_stationIdA");
	String stationID_B = (String)session.getAttribute("trip_stationIdB"); 
	String travelDate = (String)session.getAttribute("trip_travelDate");
	String userPK = (String)session.getAttribute("user");
	String tripType = request.getParameter("trip_type");
	String travelClass = request.getParameter("travel_class");
	String passType = request.getParameter("pass_type");
	int rtFlag = (Integer)session.getAttribute("rtFlag");
	
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
	
	if(passType.equals("weekly")){
		netFare *= .95;
	}else if(passType.equals("monthly")){
		netFare *= .9;
	}

	if(discountGroup.equals("na")){
		netFare *= 1;
	}else{
		netFare *= 0.5;
	}

	
	
	//final fare out.print(netFare);
	if(rtFlag == 1){
		tripType="round trip";	
	}
	   

	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		
		//getSeat number 
		PreparedStatement pstTrain = conn.prepareStatement("SELECT number_of_seats from Trains where train_id = ?");
		pstTrain.setString(1, trainID);
		ResultSet rsT = pstTrain.executeQuery();
		int seatNum = 0;
		String seatNumStr = "";
		if(rsT.first()){
			seatNum = rsT.getInt("number_of_seats");
			seatNumStr = String.valueOf(seatNum);
			//response.sendRedirect("./index.jsp");
		}
		if(seatNum == 0){
			%>
			<script>
				funcWarn();
				window.location = "./browse.jsp";
        	</script>
			<%
			conn.close();
		}
		
		
		//update seats in train
		PreparedStatement psU = conn.prepareStatement("UPDATE Trains SET number_of_seats = ? WHERE train_id = ?");
		psU.setInt(1,seatNum-1);
		psU.setString(2, trainID);
		int result1 = psU.executeUpdate();
		
		
		//scheduled date
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parsed = format.parse(travelDate);
		java.sql.Date sql = new java.sql.Date(parsed.getTime());
			
		//****
		
		//current date
		java.util.Date utilCurrDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlCurrDate = new java.sql.Date(utilCurrDate.getTime());
		
		
		//convert time
		java.util.Date autilTime = new SimpleDateFormat("hh:mm:ss").parse(aTime); 
		// Convert it to java.sql.Date
		java.sql.Time asqlTime = new java.sql.Time(autilTime.getTime());

		//convert time
		java.util.Date dutilTime = new SimpleDateFormat("hh:mm:ss").parse(dTime); 
		// Convert it to java.sql.Date
		java.sql.Time dsqlTime = new java.sql.Time(dutilTime.getTime());
		
		PreparedStatement pst = conn.prepareStatement("INSERT INTO Reservation(trip,class,discount,fee,origin_station_id,destination_station_id,line_name,train_id,schedule_date,departure_time,seat_number,reservation_date,username,arrival_time, pass) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1, tripType);
		pst.setString(2, travelClass);
		pst.setString(3, discountGroup);
		pst.setFloat(4, (float)netFare);
		pst.setString(5, stationID_A);
		pst.setString(6, stationID_B);
		pst.setString(7, lineName);
		pst.setString(8, trainID);
		pst.setDate(9, sql);
		pst.setTime(10, dsqlTime);
		//seat number
		pst.setString(11, seatNumStr);
		pst.setDate(12, sqlCurrDate);
		pst.setString(13, userPK);	
		pst.setTime(14, asqlTime);
		pst.setString(15, passType);
		
		//round trip
		rtFlag++;
		if(tripType.equals("round trip") && rtFlag == 1){
			%>
			<script>
			funcRT();
			window.location = "./browse.jsp";
			</script>
			<%
			session.setAttribute("rtFlag", rtFlag++);
		}else if(rtFlag > 1){
			session.setAttribute("rtFlag", 0);
		}
		
		
		//execute the sql query
		int result = pst.executeUpdate();
		out.print("<div id=\"alert\">Reservation successfully created!</div>");
		
		
		%>
		<div>
			<img src="./ACtrain.gif" id = "gif">
		</div>
		<div id = "buttonWrapper">
			<div id = "firstButton">
				<% 
				String viewQuestions = "<form method=\"get\" action=\"./browse.jsp\"><button id=\"button\" type=\"submit\" id=\"button\">Browse Schedules</button></form>";
				out.print(viewQuestions);
				%>
			</div>
			<% 	
			String backHome = "<form method=\"get\" action=\"./index.jsp\"><button id=\"button\" type=\"submit\" id=\"button\">Back to Homepage</button></form>";
			out.print(backHome);
			%>
		</div>
		
		<% 
		
			//close connection
			conn.close();
		} catch(Exception e){
			out.print(e);
		}
		%>
			</div>
	</div>
</body>
</html>