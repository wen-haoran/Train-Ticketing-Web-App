
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Train Schedule</title>
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
			<h3>Add a new reservation:</h3>
			<form action="./reserveAddLogic.jsp" class="add">
				<div class="add">
					Line: <input id = "input" type="text" name="line" id="line" onblur="validate()" required>
				</div>
				<div class="add">
					Train ID: <input id = "input" type="number" name="train" id="train" onblur="validate()" required>
				</div>
				<div class="add">
					Departure Time: <input id = "input" type="time" name="departTime" id="departTime" onblur="validate()" required>
				</div>
				<div class="add">
					Travel Date: <input id = "input" type="date" name="travelDate" id="travelDate" onblur="validate()" required>
				</div>
				<div class="add">
					Origin Station ID: <input id = "input" type="text" name="originId" id="originId" onblur="validate()" required>
				</div>
				<div class="add">
					Destination Station ID: <input id = "input" type="text" name="destinationId" id="destinationId" onblur="validate()" required>
				</div>
				<div class="add">
					Date of Reservation: <input id = "input" type="date" name="reserveDate" id="reserveDate" onblur="validate()" required>
				</div>
				<div class="add">
					Trip Type: <input id = "input" type="text" name="trip" id="trip" onblur="validate()" required>
				</div>
				<div class="add">
					Seat Class: <input id = "input" type="text" name="class" id="class" onblur="validate()" required>
				</div>
				<div class="add">
					Discount: <input id = "input" type="number" name="discount" id="discount" onblur="validate()" required>
				</div>
				<div class="add">
					Fee: <input id = "input" type="number" name="fee" id="fee" onblur="validate()" required>
				</div>
				<div class="add">
					Seat Number: <input id = "input" type="text" name="seatNum" id="seatNum" onblur="validate()" required>
				</div>
				<div class="add">
					Employee SSN: <input id = "input" type="text" name="employee" id="employee" onblur="validate()" required>
				</div>
				<div class="add">
					Customer Username: <input id = "input" type="text" name="username" id="username" onblur="validate()" required>
				</div>
				<button id = "button" type="submit">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>
