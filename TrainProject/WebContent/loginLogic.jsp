<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Confirmation</title>
</head>
<body>
	<h3>Log In Confirmation</h3>
	<%
	
	//query database to display user info 
	
	//code below is just me test jsp 
	//delete code below
		String usr = request.getParameter("username");
		out.print(usr+"<br>");
		
		String pas = request.getParameter("password");
		out.print(pas+"<br>");
	%>
	
</body>
</html>