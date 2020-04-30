<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="./zCss/loginPage.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id = "loginSquare">
		<div id= "loginText">
			<div id = "login">LOGIN</div>
			<img src="./ACtrain.gif" id = "gif">
	
			<form method="get" action="./loginLogic.jsp" id="form">
				<table>
					<tr>    
						<td>Username</td><td><input type="text" name="username" id = "input" required></td>
					</tr>
					<tr>
						<td>Password</td><td><input type="password" name="password" id = "input" required></td>
					</tr>
				</table>
				<br>
				<input type="submit" value="Login" id = "button">
			</form>
	
			<br>
			<form method="get" action="./registerPage.jsp" id = "form2">
				Don't have an account?
				<br>
				<br>
				<button type="submit" id = "button2">Register</button>
			</form>
		</div>
	</div>
</body>
</html>