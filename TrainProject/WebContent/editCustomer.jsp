<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Customer</title>
</head>
<body>
	<% 
	try{
		ApplicationDB db = new ApplicationDB();
		Connection conn = db.getConnection();
      	PreparedStatement ps = conn.prepareStatement("SELECT * FROM Customer WHERE username = ?");
      	ps.setString(1,request.getParameter("editCustomerUsername"));
      	ResultSet rs = ps.executeQuery();
      	if(rs.first()){
 			%>
      		<form action="./editCustomer2.jsp">
      		<div>Editing this Customer:  <input type="text" name="originalCustomer" readonly="readonly" value=<%=rs.getString("username")%>></div>
      		<br>
      		<div>
      			Username: <input type="text" name="fieldCustomerUsername" id="fieldCustomerUsername" value=<%=rs.getString("username")%> required>
      		    Password: <input type="password" name="fieldCustomerPassword" id="fieldCustomerPassword" value=<%=rs.getString("password") %> required>
      		</div>
      		<br>
      		<div >
      		    First Name: <input type="text" name="fieldCustomerFirst_name" id="fieldCustomerFirst_name" value=<%= rs.getString("first_name") %> required>
      			Last Name: <input type="text" name="fieldCustomerLast_name" id="fieldCustomerLast_name" value=<%= rs.getString("last_name") %> required>
      	  	</div>
      	  	<br>
      		<div>
	    Email: <input type="email" name="fieldCustomerEmail" id="fieldCustomerEmail" value=<%= rs.getString("email") %> required>
	  </div>
      		<div>
			    Phone Number: <input type="tel" name="fieldCustomerTelephone" id="fieldCustomerTelephone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value=<%= rs.getString("telephone") %> required>
				<small>(XXX-XXX-XXXX)</small>
      		</div>
      	<div class="registration">
	    Address: <input type="text" name="fieldCustomerAddress" id="fieldCustomerAddress" value=<%= rs.getString("address") %> required>
	  </div>
      	<div>
	    City: <input type="text" name="fieldCustomerCity" id="fieldCustomerCity" value=<%= rs.getString("city") %> required>
			State: <select name="fieldCustomerState" id="fieldCustomerState" size="1">
			  <option selected="selected" value = <%= rs.getString("state")%>> <%= rs.getString("state")%></option>
			  <option value="AK">AK</option>
			  <option value="AL">AL</option>
			  <option value="AR">AR</option>
			  <option value="AZ">AZ</option>
			  <option value="CA">CA</option>
			  <option value="CO">CO</option>
			  <option value="CT">CT</option>
			  <option value="DC">DC</option>
			  <option value="DE">DE</option>
			  <option value="FL">FL</option>
			  <option value="GA">GA</option>
			  <option value="HI">HI</option>
			  <option value="IA">IA</option>
			  <option value="ID">ID</option>
			  <option value="IL">IL</option>
			  <option value="IN">IN</option>
			  <option value="KS">KS</option>
			  <option value="KY">KY</option>
			  <option value="LA">LA</option>
			  <option value="MA">MA</option>
			  <option value="MD">MD</option>
			  <option value="ME">ME</option>
			  <option value="MI">MI</option>
			  <option value="MN">MN</option>
			  <option value="MO">MO</option>
			  <option value="MS">MS</option>
			  <option value="MT">MT</option>
			  <option value="NC">NC</option>
			  <option value="ND">ND</option>
			  <option value="NE">NE</option>
			  <option value="NH">NH</option>
			  <option value="NJ">NJ</option>
			  <option value="NM">NM</option>
			  <option value="NV">NV</option>
			  <option value="NY">NY</option>
			  <option value="OH">OH</option>
			  <option value="OK">OK</option>
			  <option value="OR">OR</option>
			  <option value="PA">PA</option>
			  <option value="RI">RI</option>
			  <option value="SC">SC</option>
			  <option value="SD">SD</option>
			  <option value="TN">TN</option>
			  <option value="TX">TX</option>
			  <option value="UT">UT</option>
			  <option value="VA">VA</option>
			  <option value="VT">VT</option>
			  <option value="WA">WA</option>
			  <option value="WI">WI</option>
			  <option value="WV">WV</option>
			  <option value="WY">WY</option>
			</select>
			Zipcode: <input type="text" name="fieldCustomerZipcode" id="fieldCustomerZipcode" pattern=[0-9]{5} value=<%= rs.getString("zip_code") %> required>
	  </div>
		<br>
		<button type="submit">Submit</button>
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