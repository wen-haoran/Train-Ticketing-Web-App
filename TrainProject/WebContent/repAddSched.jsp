
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a Train Schedule</title>
</head>
<body>
	<%
		//get date
		java.util.Date utilDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	%>
	<form method="get" action="./repIndex.jsp">
		<button type="submit">Home</button>
	</form>
	<div id = "registerSquare">
		<div id = "registerText">
			<h3>Add a new train schedule: </h3>
			<form action="./repAddSchedLogic.jsp" class="add">
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
					Date of Reservation: <input id = "input" type="date" name="travelDate" id="travelDate" onblur="validate()" required>
				</div>
				<button id = "button" type="submit">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>
