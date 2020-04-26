<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="./zCss/loginLogic.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id = "alertSquare">
		<div id = "alertText">
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
						out.println("<div id=\"alert\">Username or password is invalid.</div>");
						String s = "<form method=\"get\" action=\"./loginPage.jsp\"><button type=\"submit\"  id=\"button\">Try Again</button></form>";
						out.print(s);
					}
				%>
				<div>
					<img src="./ACtrain.gif" id = "gif">
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