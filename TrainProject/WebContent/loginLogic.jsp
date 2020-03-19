<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Confirmation</title>
</head>
<body>
	<h3>Log In Confirmation</h3>
	<%
	
		
		try{
			//connect to db
			ApplicationDB db = new ApplicationDB();	
			Connection conn = db.getConnection();		
			//get username and password
			String usr = request.getParameter("username");
			String pas = request.getParameter("password");
			//query the db with input data
			PreparedStatement pst = conn.prepareStatement("SELECT username, password from Customer where username=? and password=?");
			pst.setString(1, usr);
			pst.setString(2, pas);
			//execute the sql query
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				out.println("You have successfully login");
				//direct to profile/logout page
			}else{
				//return to home mage
				out.println("Username or password is invalid");
				String s = "<form method=\"get\" action=\"./index.jsp\"><button type=\"submit\">Try Again</button></form>";
				out.print(s);
			}
			//close connection
			conn.close();
		} catch(Exception e){
			out.print(e);
		}

	%>
	
</body>
</html>