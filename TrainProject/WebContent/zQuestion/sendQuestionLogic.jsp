<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success!</title>
<link href="../zCss/sendQuestionLogic.css" rel="stylesheet" type="text/css">
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
					String userPK = (String)session.getAttribute("user");
					String question = request.getParameter("question");
					
					//get date
					java.util.Date utilDate = new java.util.Date();
					// Convert it to java.sql.Date
					java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			
					//query the db with input data
					PreparedStatement pst = conn.prepareStatement("INSERT INTO TrainWebApp1.Question(question,question_date,username) VALUES (?,?,?)");
					pst.setString(1, question);
					pst.setDate(2, sqlDate);
					pst.setString(3, userPK);
					//execute the sql query
					int result = pst.executeUpdate();
					out.print("<div id=\"alert\">Question successfully sent!</div>");
				%>
				<div>
					<img src="../ACtrain.gif" id = "gif">
				</div>
				<div id = "buttonWrapper">
					<div id = "firstButton">
						<% 
						String viewQuestions = "<form method=\"get\" action=\"./viewQuestion.jsp\"><button type=\"submit\" id=\"button\">View All Questions</button></form>";
						out.print(viewQuestions);
						%>
					</div>
					<% 	
					String backHome = "<form method=\"get\" action=\"../index.jsp\"><button type=\"submit\" id=\"button\">Back to Homepage</button></form>";
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