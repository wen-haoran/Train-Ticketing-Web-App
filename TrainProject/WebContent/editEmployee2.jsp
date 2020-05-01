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
	//connect to db
	ApplicationDB db = new ApplicationDB();	
	Connection conn = db.getConnection();
	try{
		String oldUsername = request.getParameter("originalUser");
		String newUsername = request.getParameter("fieldEmployeeUsername");
		PreparedStatement ps0 = conn.prepareStatement("SELECT ssn FROM Employee WHERE username = ?");
		ps0.setString(1, oldUsername);
		ResultSet rs0 = ps0.executeQuery();
		if(rs0.first()){
			String oldSSN = rs0.getString("ssn");
			String newSSN = request.getParameter("fieldEmployeeSSN");
			if(!(oldSSN.equals(newSSN))){
				PreparedStatement ps3 = conn.prepareStatement("SELECT * FROM Employee WHERE ssn = ?");
				ps3.setString(1, newSSN);
				ResultSet rs3 = ps3.executeQuery();
				if(rs3.first()){
					String s = "<form method=\"get\" action=\"./admin.jsp\">Username already exits<button type=\"submit\">Try again</button></form>";
		      		out.print(s);
		      		conn.close();
		      		return;
				}
			}
		}
		if(!((oldUsername.toLowerCase()).equals(newUsername.toLowerCase()))){
			PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM Employee WHERE username = ?");
			ps2.setString(1, newUsername);
			ResultSet rs2 = ps2.executeQuery();
			if(rs2.first()){
				String s = "<form method=\"get\" action=\"./admin.jsp\">Username already exits<button type=\"submit\">Try again</button></form>";
	      		out.print(s);
	      		conn.close();
	      		return;
			}
		}  
		
		
		PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM Customer WHERE username = ?");		
      	ps1.setString(1, newUsername);
      	ResultSet rs1 = ps1.executeQuery();
      	if(rs1.first()){
      		String s = "<form method=\"get\" action=\"./admin.jsp\">Username already exits<button type=\"submit\">Try again</button></form>";
      		out.print(s);
      		conn.close();
      		return;
      	}
      	
		PreparedStatement ps = conn.prepareStatement("UPDATE Employee SET username = ?, password = ?, first_name = ?, last_name = ?, ssn= ?, access_level = ? WHERE username = ?");
		ps.setString(1, request.getParameter("fieldEmployeeUsername"));
		ps.setString(2, request.getParameter("fieldEmployeePassword"));
		ps.setString(3, request.getParameter("fieldEmployeeFirst_name"));
		ps.setString(4, request.getParameter("fieldEmployeeLast_name"));
		ps.setString(5, request.getParameter("fieldEmployeeSSN"));
		ps.setString(6, request.getParameter("fieldEmployeeAccess_level"));
		ps.setString(7, oldUsername);
		ps.executeUpdate();
		
		String s = "<form method=\"get\" action=\"./admin.jsp\">Successfully Updated Employee<button type=\"submit\">Go back</button></form>";
     	out.print(s);
      	
		//close connection
		conn.close();
	} catch(Exception e){
		/* String s = "<form method=\"get\" action=\"./admin.jsp\">Employee already exits<button type=\"submit\">Try again</button></form>";
  		out.print(s);
  		conn.close();
  		return; */
		out.print(e);
	}
	%>
</body>
</html>