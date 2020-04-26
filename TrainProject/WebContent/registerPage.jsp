
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Here</title>
<link href="./zCss/registerPage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id = "registerSquare">
		<div id = "registerText">
			<h1>Register Here</h1>
			<form action="./registerLogic.jsp" class="registration">
				<div class="registration">
					Username: <input id = "input" type="text" name="user" id="user" onblur="validate()" required>
				</div>
				<div class="password">
			    Password: <input id = "input" type="password" name="password" id="password" required>
			  </div>
				<br>
				<div class="registration">
			    First Name: <input id = "input" type="text" name="fname" id="fname" required>
					Last Name: <input id = "input" type="text" name="lname" id="lname" required>
			  </div>
				<div class="registration">
			    Email: <input id = "input" type="email" name="email" id="email" required>
			  </div>
				<div class="registration">
			    Phone Number: <input id = "input" type="tel" name="phone" id="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
					<small>(XXX-XXX-XXXX)</small>
			  </div>
				<br>
				<div class="registration">
			    Address: <input id = "input" type="text" name="address" id="address" required>
			  </div>
				<div class="registration">
			    City: <input id = "input" type="text" name="city" id="city" required>
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
					Zipcode: <input id = "input" type="text" name="zipcode" id="zipcode" pattern=[0-9]{5} required>
			  </div>
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
