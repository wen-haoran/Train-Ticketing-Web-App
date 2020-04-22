<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.*"%>
 

 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search for Question</title>
</head>
<body>
	<h2>Search for Question Page</h2>
	
	
	<form method="get" action="./viewSearchedQuestions.jsp">  
		<label>Please enter a keyword or phrase you would like to search for:</label>
		<br>
		<textarea name="searchKey" rows="2" cols="50" required></textarea>	
		<br>	
		<input type="submit" value="Search for Question">
	</form>
	
	<%
	//make return to all questions option
	String viewAllQuestions = "<form method=\"get\" action=\"./viewQuestion.jsp\"><button type=\"submit\">View All Questions</button></form>";
	out.print(viewAllQuestions);
	%>
	
</body>
</html>