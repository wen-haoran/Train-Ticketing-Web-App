<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Customer</title>
</head>
<body>
	<% 
	//connect to db
	ApplicationDB db = new ApplicationDB();	
	Connection conn = db.getConnection();		
	try{
		String oldUsername = request.getParameter("originalCustomer");
		String newUsername = request.getParameter("fieldCustomerUsername");
		
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM Employee WHERE username = ?");
      	ps.setString(1, newUsername);
      	ResultSet rs = ps.executeQuery();
		if(rs.first()){
			String s = "<form method=\"get\" action=\"./admin.jsp\">Username already exists<button type=\"submit\">Try again</button></form>";
      		out.print(s);
      		conn.close();
      		return;
		}
		
		if(!(oldUsername.toLowerCase().equals(newUsername.toLowerCase()))){
			PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM Customer WHERE username = ?");
	      	ps1.setString(1, newUsername);
	      	ResultSet rs1 = ps1.executeQuery();
			if(rs1.first()){
				String s = "<form method=\"get\" action=\"./admin.jsp\">Username already exists<button type=\"submit\">Try again</button></form>";
	      		out.print(s);
	      		conn.close();
	      		return;
			}
		}
		
		//query the db with input data
		ps = conn.prepareStatement("UPDATE Customer SET username = ?, password = ?, first_name = ?, last_name = ?, email = ?, telephone = ?, address = ?, city = ?, state = ?, zip_code = ? WHERE username = ?");
		ps.setString(1, request.getParameter("fieldCustomerUsername"));
		ps.setString(2, request.getParameter("fieldCustomerPassword"));
		ps.setString(3, request.getParameter("fieldCustomerFirst_name"));
		ps.setString(4, request.getParameter("fieldCustomerLast_name"));
		ps.setString(5, request.getParameter("fieldCustomerEmail"));
		ps.setString(6, request.getParameter("fieldCustomerTelephone"));
 		ps.setString(7, request.getParameter("fieldCustomerAddress"));
 		ps.setString(8, request.getParameter("fieldCustomerCity"));
 		ps.setString(9, request.getParameter("fieldCustomerState"));
 		ps.setString(10, request.getParameter("fieldCustomerZipcode"));
 		ps.setString(11, oldUsername);
 		
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