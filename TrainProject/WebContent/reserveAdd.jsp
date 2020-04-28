
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Train Schedule</title>
<link href="./zCss/registerPage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		//get date
		java.util.Date utilDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	%>
	<div id = "registerSquare">
		<div id = "registerText">
			<h1>Register Here</h1>
			<form action="./reserveAddLogic.jsp" class="add">
				<div class="add">
					Line: <input id = "input" type="text" name="line" id="line" onblur="validate()" required>
				</div>
				<div class="add">
					Train ID: <input id = "input" type="number" name="train" id="train" onblur="validate()" required>
				</div>
				<div class="add">
					Starting Time: <input id = "input" type="time" name="startTime" id="startTime" onblur="validate()" required>
				</div>
				<div class="add">
					Travel Time: <input id = "input" type="time" name="travelTime" id="travelTime" onblur="validate()" required>
				</div>
				<div class="add">
					Trip Type: <input id = "input" type="text" name="line" id="line" onblur="validate()" required>
				</div>
				<div class="add">
					Seat Class: <input id = "input" type="number" name="train" id="train" onblur="validate()" required>
				</div>
				<div class="add">
					Discount: <input id = "input" type="time" name="startTime" id="startTime" onblur="validate()" required>
				</div>
				<div class="add">
					Fee: <input id = "input" type="time" name="travelTime" id="travelTime" onblur="validate()" required>
				</div>
				<div class="add">
					Seat Number: <input id = "input" type="text" name="line" id="line" onblur="validate()" required>
				</div>
				<div class="add">
					Employee SSN: <input id = "input" type="number" name="train" id="train" onblur="validate()" required>
				</div>
				<div class="add">
					Customer Username: <input id = "input" type="time" name="startTime" id="startTime" onblur="validate()" required>
				</div>
				<div class="add">
					Fee: <input id = "input" type="time" name="travelTime" id="travelTime" onblur="validate()" required>
				</div>
				<br>
				Date of Travel:
				<%
					String todayDate = "<input type=\"date\" value=\""+sqlDate+"\" name=\"traveldate\" required>";
					out.print(todayDate);
				%>
				<br>
				<button id = "button" type="submit">Submit</button>
			</form>
			<form method="get" action="./loginPage.jsp">
				Already registered?
				<button id = "button2" type="submit">Log In</button>
			</form>
		</div>
	</div>
</body>
</html>
