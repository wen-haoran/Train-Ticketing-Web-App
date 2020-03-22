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
			PreparedStatement pst = conn.prepareStatement("SELECT username, password, first_name from Customer where username=? and password=?");
			pst.setString(1, usr);
			pst.setString(2, pas);
			//execute the sql query
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				String dbPassword = rs.getString("password");
				if (pas.equals(dbPassword)) {
					out.println("You have successfully login");	
					session.setAttribute("user", usr);
					session.setAttribute("first_name", rs.getString("first_name"));
					response.sendRedirect("index.jsp");
				}
				
			}else{
				//return to login mage
				out.println("Username or password is invalid");
				String s = "<form method=\"get\" action=\"./loginPage.jsp\"><button type=\"submit\">Try Again</button></form>";
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