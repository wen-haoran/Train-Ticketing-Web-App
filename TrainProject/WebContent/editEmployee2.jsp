<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>
</head>
<body>

	<% 

	try{
		//connect to db
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();		

		//query the db with input data
		PreparedStatement ps = conn.prepareStatement("UPDATE Employee SET username = ?, password = ?, first_name = ?, last_name = ?, ssn= ?, access_level = ? WHERE username = ?");
		ps.setString(1, request.getParameter("fieldEmployeeUsername"));
		ps.setString(2, request.getParameter("fieldEmployeePassword"));
		ps.setString(3, request.getParameter("fieldEmployeeFirst_name"));
		ps.setString(4, request.getParameter("fieldEmployeeLast_name"));
		ps.setString(5, request.getParameter("fieldEmployeeSSN"));
		ps.setString(6, request.getParameter("fieldEmployeeAccess_level"));
 		ps.setString(7, request.getParameter("originalUser"));

		//execute the sql query
		int result = ps.executeUpdate();
		
		String s = "<form method=\"get\" action=\"./admin.jsp\">Successfully Updated Employees<button type=\"submit\">Go back</button></form>";
     	out.print(s);
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>