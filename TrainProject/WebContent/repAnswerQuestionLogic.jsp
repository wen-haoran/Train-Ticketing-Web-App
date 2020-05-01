<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.*"%>
 

 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Answer Question</title>
</head>
<body>
	
	<div id= "questionSquare">
		<div id= "questionText">
			<h2>Answer Question</h2>
			<label>Enter Answer Below</label>
			<form method="get" action="./repAnswerQuestionLogic2.jsp" id = "form">  
				<input type="hidden" type="number" name="question_num" id="question_num" value = "<%=request.getParameter("quest")%>">

				<br>
				<textarea name="answer" rows="5" cols="50" required></textarea>	
				<br>
				<div id = "buttonWrapper">
					<input type="submit" value="Submit Answer" id = "button">
				</div>	
			</form>
			<%
			//make return to all questions option
			String viewAllQuestions = "<form method=\"get\" action=\"./repAnswerQuestion.jsp\"><button type=\"submit\" id=\"button2\">View All Questions</button></form>";
			out.print(viewAllQuestions);
			%>
		</div>
	</div>
</body>
</html>