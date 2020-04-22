<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.*"%>
 

 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Question</title>
</head>
<body>
	<h2>Send Question</h2>
	
	
	<form method="get" action="./sendQuestionLogic.jsp">  
		<label>What would you like to ask?</label>
		<br>
		<textarea name="question" rows="4" cols="50" required></textarea>	
		<br>	
		<input type="submit" value="Send Question">
	</form>
	
</body>
</html>