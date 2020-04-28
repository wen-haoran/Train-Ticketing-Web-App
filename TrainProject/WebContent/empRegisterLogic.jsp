<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration</title>
</head>
<body>
	
	<div id = "alertSquare">
		<div id = "alertText">
			<%
		    try{
		    	ApplicationDB db = new ApplicationDB();
				Connection conn = db.getConnection();
		      	PreparedStatement ps = conn.prepareStatement("SELECT * FROM Employee WHERE username = ?");
		      	PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM Employee WHERE ssn = ?");
		      	ps.setString(1,request.getParameter("user"));
		      	ps2.setString(1, request.getParameter("empSSN"));
		      	ResultSet rs = ps.executeQuery();
		      	ResultSet rs2 = ps2.executeQuery();
		      	if(rs.first() || rs2.first()){
					out.println("<div id=\"alert\">An employee is already registered with this username/SSN.</div>");
					String s = "<form method=\"get\" action=\"./empRegister.jsp\"><button type=\"submit\" id=\"button\">Try Again</button></form>";
					out.print(s);
		      	}else{  
					ps = conn.prepareStatement("INSERT INTO Employee(username,password, first_name, last_name, ssn, access_level) VALUES (?,?,?,?,?,?)");
					ps.setString(1, request.getParameter("empUser"));
					ps.setString(2, request.getParameter("empPassword"));
					ps.setString(3, request.getParameter("empFname"));
					ps.setString(4, request.getParameter("empLname"));
					ps.setString(5, request.getParameter("empSSN"));	
					ps.setString(6, request.getParameter("empLevel"));
					int result = ps.executeUpdate();
					out.print("<div id=\"alert\">Registration successful!</div>");
					String s = "<form method=\"get\" action=\"./loginPage.jsp\"><button type=\"submit\" id=\"button\">Log In</button></form>";
					out.println(s);
		      	}
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