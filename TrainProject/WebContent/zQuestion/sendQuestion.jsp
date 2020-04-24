<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.*"%>
 

 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Question</title>
<link href="../zCss/sendQuestion.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<div id= "questionSquare">
		<div id= "questionText">
			<h2>Send A Question</h2>
			<label>What would you like to ask us?</label>
			<form method="get" action="./sendQuestionLogic.jsp" id = "form">  
				<br>
				<textarea name="question" rows="5" cols="50" required></textarea>	
				<br>
				<div id = "buttonWrapper">
					<input type="submit" value="Send Question" id = "button">
				</div>	
			</form>
			<%
			//make return to all questions option
			String viewAllQuestions = "<form method=\"get\" action=\"./viewQuestion.jsp\"><button type=\"submit\" id=\"button2\">View All Questions</button></form>";
			out.print(viewAllQuestions);
			%>
		</div>
	</div>
	
</body>
</html>