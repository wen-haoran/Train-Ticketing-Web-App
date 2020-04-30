<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.*"%>
 

 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Question</title>
<link href="../zCss/sendQuestion.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<div id= "questionSquare">
		<div id= "questionText">
			<h2>Send A Question</h2>
			<label>What would you like to ask us?</label>
			<form method="get" action="./sendQuestionLogic.jsp" id = "form">  
				<br>
				<textarea name="question" rows="5" cols="50" required></textarea>	
				<br>
				<div id = "buttonWrapper">
					<input type="submit" value="Send Question" id = "button">
				</div>	
			</form>
			<%
			//make return to all questions option
			String viewAllQuestions = "<form method=\"get\" action=\"./viewQuestion.jsp\"><button type=\"submit\" id=\"button2\">View All Questions</button></form>";
			out.print(viewAllQuestions);
			%>
		</div>
	</div>
			<%
			try {
				//connect to database
				ApplicationDB db = new ApplicationDB();
				Connection conn = db.getConnection();
				String userPK = (String)session.getAttribute("user");
				
				//fetch all reservations from this user that is delayed
		      	PreparedStatement ps = conn.prepareStatement("SELECT origin_station_id, destination_station_id FROM Reservation WHERE username = ? AND isDelay = true");
				ps.setString(1, userPK);
		      	ResultSet rs = ps.executeQuery();
		      	
		      	//send alert
		      	while(rs.next()){
		      	%>
					<script>
						alert("Your reservation from Station " + <%=rs.getString("origin_station_id")%> + " to Station " + <%=rs.getString("destination_station_id")%> + " has been delayed.");
					</script>
				<%
		      	}
		      	
		      	//change it back to not delayed
		      	PreparedStatement ps1 = conn.prepareStatement("UPDATE Reservation SET isDelay = 0 WHERE username = ?");
				ps1.setString(1, userPK);
		      	int rs1 = ps1.executeUpdate(); 
		      	
				//close connection
				conn.close();
			} catch(Exception e){
				out.print(e);
			}
		%>
</body>
</html>