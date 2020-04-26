<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.*"%>
 

 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search for Questions</title>
<link href="../zCss/searchQuestion.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<div id = "searchSquare">
		<div id = "searchText">
			<h2>Search for Questions</h2>
			<form method="get" action="./viewSearchedQuestions.jsp" id = "form">  
				<label>Please enter a keyword or phrase you would like to search for:</label>
				<br>
				<br>
				<textarea name="searchKey" rows="5" cols="50" required></textarea>	
				<br>	
				<div id = "buttonWrapper">
					<input type="submit" value="Search" id = "button">
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