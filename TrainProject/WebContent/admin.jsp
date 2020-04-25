<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin Page</title>
</head>
<body>
<h1>Admin Page</h1>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("loginPage.jsp");
    } else {
        //String name = (String)session.getAttribute("first_name");
        out.print("Welcome, you are viewing the admin page.");
    }
%>
<script type="text/javascript">

function display() {
	var ddl = document.getElementById("target");
	var selectedValue = ddl.options[ddl.selectedIndex].value;
    if (document.getElementById('employeeCheck').checked) {
    	if(selectedValue == 'add'){
    		document.getElementById('employeeAdd').style.display = 'block';
            document.getElementById('customerAdd').style.display = 'none';
            document.getElementById('employeeEdit').style.display = 'none';
    	}
    	else if(selectedValue == 'edit'){
    		document.getElementById('employeeAdd').style.display = 'none';
            document.getElementById('customerAdd').style.display = 'none';
        	document.getElementById('employeeEdit').style.display = 'block';
        }else if(selectValue == 'delete'){
        	
        }
        
    }else if(document.getElementById('customerCheck')){
    	if(selectedValue == 'add'){
    		document.getElementById('employeeAdd').style.display = 'none';
            document.getElementById('customerAdd').style.display = 'block';
            document.getElementById('employeeEdit').style.display = 'none';
    	}
    	else if(selectedValue == 'edit'){
        	
        }else if(selectValue == 'delete'){
        	
        }
    }
}
</script>

<p>
Do you want to make changes to employees or customers?<br>
Employee <input type="radio" onclick="javascript:display();" name="yesno" id="employeeCheck"> 
Customer <input type="radio" onclick="javascript:display();" name="yesno" id="customerCheck">
</p>

<p>
Do you want to add, edit, or delete?<br>
<select id="target"  onchange="javascript:display();">
      <option value="">Select One</option>
      <option value="add">add</option>
      <option value="edit">edit</option>
      <option value="delete">delete</option>
</select>
</p>
<div id="employeeEdit" style="display:none">
<form action="./editEmployee.jsp" class="registration">
	<div class="registration">
		Username: <input type="text" name="editEmployeeUsername" required>
	</div>
	<button type='submit'> Search</button>
</form>
</div>

<div id="employeeAdd" style="display:none">
Fill in all the fields to add a new employee:<br>
<form action="./registerEmployee.jsp" class="registration">
	<div class="registration">
		Username: <input type="text" name="employeeUsername" id="employeeUsername" required>
	    Password: <input type="password" name="employeePassword" id="employeePassword" required>
	</div>
	<br>
	<div class="registration">
	    First Name: <input type="text" name="employeeFirst_name" id="employeeFirst_name" required>
		Last Name: <input type="text" name="employeeLast_name" id="employeeLast_name" required>
  	</div>
  	<br>
	<div>
		SSN: <input type="tel" pattern="[0-9]{9}" name="employeeSSN" id="employeeSSN" required>
		<small> No Dashes</small>
	</div>
	<div>
		Access Level: <input type="numeric" pattern="[1-3]{1}" name="employeeAccess_level" id="employeeAccess_level" required>
		<small>Input the corresponding number based on the role<br>
		Employee=1, Admin=2, Customer Representative=3
		</small>
	</div>
<br>
<button type='submit'> Submit</button>
</form>
</div>

<div id="customerAdd" style="display:none">
Fill in all the fields to add a new customer:<br>
<form action="./registerCustomer.jsp" class="registration">
		<div class="registration">
			Username: <input type="text" name="user" id="user" required>
		</div>
		<div class="password">
	    Password: <input type="password" name="password" id="password" required>
	  </div>
		<br>
		<div class="registration">
	    First Name: <input type="text" name="fname" id="fname" required>
			Last Name: <input type="text" name="lname" id="lname" required>
	  </div>
		<div class="registration">
	    Email: <input type="email" name="email" id="email" required>
	  </div>
		<div class="registration">
	    Phone Number: <input type="tel" name="phone" id="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
			<small>(XXX-XXX-XXXX)</small>
	  </div>
		<br>
		<div class="registration">
	    Address: <input type="text" name="address" id="address" required>
	  </div>
		<div class="registration">
	    City: <input type="text" name="city" id="city" required>
			State: <select name="state" size="1">
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
			Zipcode: <input type="text" name="zipcode" id="zipcode" pattern=[0-9]{5} required>
	  </div>
		<br>
		<button type="submit">Submit</button>
	</form>
</div>





