<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Login To Your Account</h3>


	<form method="get" action="./loginLogic.jsp">
		<table>
			<tr>    
				<td>Username</td><td><input type="text" name="username" required></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="password" name="password" required></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
	
	
	<br>
	Don't have an account?
	<form method="get" action="./registerPage.jsp">
		<button type="submit">Register</button>
	</form>

</body>
</html>