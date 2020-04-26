<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>
</head>
<body>
	<% 
	try{
		ApplicationDB db = new ApplicationDB();
		Connection conn = db.getConnection();
      	PreparedStatement ps = conn.prepareStatement("SELECT * FROM Employee WHERE username = ?");
      	ps.setString(1,request.getParameter("editEmployeeUsername"));
      	ResultSet rs = ps.executeQuery();
      	if(rs.first()){
 			%>
      		<form action="./editEmployee2.jsp" class="registration">
      		<div>Editing this Employee:  <input type="text" name="originalUser" readonly="readonly" value=<%=rs.getString("username")%>></div>
      		<br>
      		<div class="registration">
      			Username: <input type="text" name="fieldEmployeeUsername" id="fieldEmployeeUsername" value=<%=rs.getString("username")%> required>
      		    Password: <input type="password" name="fieldEmployeePassword" id="fieldEmployeePassword" value=<%=rs.getString("password") %> required>
      		</div>
      		<br>
      		<div class="registration">
      		    First Name: <input type="text" name="fieldEmployeeFirst_name" id="fieldEmployeeFirst_name" value=<%= rs.getString("first_name") %> required>
      			Last Name: <input type="text" name="fieldEmployeeLast_name" id="fieldEmployeeLast_name" value=<%= rs.getString("last_name") %> required>
      	  	</div>
      	  	<br>
      		<div>
      			SSN: <input type="tel" pattern="[0-9]{9}" name="fieldEmployeeSSN" id="fieldEmployeeSSN" value=<%=rs.getString("ssn") %> required>
      			<small> No Dashes</small>
      		</div>
      		<div>
      			Access Level: <input type="numeric" pattern="[1-3]{1}" name="fieldEmployeeAccess_level" id="fieldEmployeeAccess_level" value=<%=rs.getString("access_level")%> required>
      			<small>Input the corresponding number based on the role<br>
      			Employee=1, Admin=2, Customer Representative=3
      			</small>
      		</div>
      	<br>
      	<button type='submit'> Submit</button>
      	</form>
      	<% 
      	}else{ 
      		out.println("This username does not exist.");
			String s = "<form method=\"get\" action=\"./admin.jsp\"><button type=\"submit\">Return</button></form>";
			out.print(s);
      	} 
		
		//close connection
		conn.close();
	} catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>