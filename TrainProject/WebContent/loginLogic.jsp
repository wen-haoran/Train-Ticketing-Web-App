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
					PreparedStatement ps = conn.prepareStatement("SELECT username, password, access_level from Employee where username=? and password=?");
					ps.setString(1, usr);
					ps.setString(2, pas);
					//execute the sql query
					ResultSet rs = ps.executeQuery();
					if(rs.next()){
						String dbPassword = rs.getString("password");
						String accessLVL = rs.getString("access_level");
						if (pas.equals(dbPassword)) {
							if(accessLVL.equals("admin")){
								out.println("Logging in as Administrator");
								session.setAttribute("user", "admin");
								session.setAttribute("first_name", "admin");
								response.sendRedirect("admin.jsp");
							}else if(accessLVL.equals("customer_rep")){
								out.println("Logging in as Customer Rep");
								session.setAttribute("user", "customer rep");
								session.setAttribute("first_name", "customer rep");
								response.sendRedirect("repIndex.jsp");
							}else{
								out.println("Logging in as Employee");
							}
							/* out.println("You have successfully login");
							conn.close(); */
						}
					}else{
						PreparedStatement pst = conn.prepareStatement("SELECT username, password, first_name from Customer where username=? and password=?");
						pst.setString(1, usr);
						pst.setString(2, pas);
						//execute the sql query
						rs = pst.executeQuery();
						if(rs.next()){
							String dbPassword = rs.getString("password");
							if (pas.equals(dbPassword)) {
								out.println("You have successfully login!");	
								session.setAttribute("user", usr);
								session.setAttribute("first_name", rs.getString("first_name"));
								int roundTripFlag = 0;
								session.setAttribute("rtFlag", roundTripFlag);
								response.sendRedirect("index.jsp");
			
							}
							
						}else{
							//return to login mage
							out.println("<div id=\"alert\">Username or password is invalid.</div>");
							String s = "<form method=\"get\" action=\"./loginPage.jsp\"><button type=\"submit\"  id=\"button\">Try Again</button></form>";
							out.print(s);
						} 
					}
					
					
					
					//query the db with input data
					
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
