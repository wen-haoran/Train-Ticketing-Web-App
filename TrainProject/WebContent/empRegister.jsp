<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Here</title>
</head>
<body>
		<h1>Register Here</h1>
		<form action="./empRegisterLogic.jsp" class="empRegistration">
			<div class="empRegistration">
					Username: <input id = "input" type="text" name="empUser" id="empUser" onblur="validate()" required>
			</div>
			<div class="password">
			    	Password: <input id = "input" type="password" name="empPassword" id="empPassword" required>
			</div>
			<br>
			<div class="empRegistration">
			    	First Name: <input type="text" name="empFname" id="empFname" required>
					Last Name: <input type="text" name="empLname" id="empLname" required>
			</div>
			<div class="empRegistration">
			    	SSN: <input type="text" id="empSSN" name="empSSN" placeholder="XXXXXXXXX" pattern="\d{9}">
			</div>
			<br>
			Employee Level: <select name="empLevel" id="empLevel">
								<option value="0">Employee</option>
						  		<option value="1">Admin</option>
					 			<option value="2">Customer Rep</option>
					  		</select>
			<br>
			<button id = "button" type="submit">Submit</button>
		</form>
			
</body>
</html>
			  