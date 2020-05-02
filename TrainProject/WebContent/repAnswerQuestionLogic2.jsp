<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success!</title>
</head>
<body>

	<div id = "alertSquare">
		<div id = "alertText">
			<%try{
				//connect to db
				ApplicationDB db = new ApplicationDB();	
				Connection conn = db.getConnection();		
				//get primary key
				
				PreparedStatement ps = conn.prepareStatement("UPDATE Question SET answer = ? WHERE question_num = ?");
				ps.setString(1, request.getParameter("answer"));
				ps.setString(2, request.getParameter("question_num"));
				int result = ps.executeUpdate();
				
			out.print("<div id=\"alert\">Question successfully answered!</div>");
				%>
				<div>
					<img src="./ACtrain.gif" id = "gif">
				</div>
				<div id = "buttonWrapper">
					<% 	
					String backHome = "<form method=\"get\" action=\"./repIndex.jsp\"><button type=\"submit\" id=\"button\">Back to Homepage</button></form>";
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