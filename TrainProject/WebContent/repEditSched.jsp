
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Train Schedule</title>
</head>
<body>
	<%
		//get date
		java.util.Date utilDate = new java.util.Date();
		// Convert it to java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	%>
	<h3><%=request.getParameter("linep")%></h3>
	<form method="get" action="./repIndex.jsp">
		<button type="submit">Home</button>
	</form>
	<div id = "registerSquare">
		<div id = "registerText">
			<h3>Add a new train schedule: </h3>
			<form action="./repEditSchedLogic.jsp" class="add">
				<div class="add">
					Starting Time: <input id = "input" type="time" name="startTime" id="startTime"  value = "<%=request.getParameter("startTimep")%>"onblur="validate()" required>
				</div>
				<div class="add">
					Travel Time: <input id = "input" type="time" name="travelTime" id="travelTime"  value = "<%=request.getParameter("travelTimep")%>"onblur="validate()" required>
				</div>
				<div class="add">
					Date of Reservation: <input id = "input" type="date" name="travelDate" id="travelDate"  value = "<%=request.getParameter("travelDatep")%>"onblur="validate()" required>
				</div>
				<input type="hidden" type="text" name="linep" id="linep" value = "<%=request.getParameter("linep")%>">
				<input type="hidden" type="text" name="trainp" id="trainp" value = "<%=request.getParameter("trainp")%>">
				<input type="hidden" type="time" name="startTimep" id="startTimep" value = "<%=request.getParameter("startTimep")%>">
				<input type="hidden" type="date" name="travelDatep" id="travelDatep" value = "<%=request.getParameter("travelDatep")%>">
				<button id = "button" type="submit">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>
