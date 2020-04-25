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
	<%
	
	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		
		//get primary key
		String reservationNumStr = request.getParameter("del");
		int reservationNum = Integer.parseInt(reservationNumStr);
		
		PreparedStatement pst = conn.prepareStatement("DELETE FROM Reservation WHERE reservation_num=?");
		pst.setInt(1, reservationNum);
		int result = pst.executeUpdate();
		
		out.print("Delete\n");
		//make reservation option
		String s = "<form method=\"get\" action=\"./index.jsp\"><button type=\"submit\">Go To Home</button></form>";
		out.print(s);
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	
	%>

</body>
</html>