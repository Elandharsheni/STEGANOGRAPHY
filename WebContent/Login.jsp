<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="Data.util"%>
<%@ page import="java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
<head>
	<title>Login & Register</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	 <meta charset="utf-8">
	<meta name="keywords" content="Validate Login & Register Forms Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
	
	<!-- Meta tag Keywords -->

	<!-- css files -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Magra:400,700&amp;subset=latin-ext" rel="stylesheet">
	<!-- //web-fonts -->
	<!-- VALIDATION -->
<script>
function charonly(e) {
    var unicode = e.charCode ? e.charCode : e.keyCode
    if (unicode != 8) {
        if ((unicode != 32 && (unicode < 65 || (unicode > 90 && (unicode < 97 || unicode > 122)))) && unicode != 39 && unicode != 45 && unicode != 9)
            return false
    }
}

function checkPass()
{
    //Store the password field objects into variables ...
    var password = document.getElementById('pas1');
    var confirm  = document.getElementById('pas2');
    //Store the Confirmation Message Object ...
    var message = document.getElementById('confirm-message2');
    //Set the colors we will be using ...
    var good_color = "#006400";
    var bad_color  = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field
    if((password.value.length>7)&&(confirm.value.length>7))
    {
   		 if(password.value == confirm.value)
    	{
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
        //confirm.style.backgroundColor = good_color;
        message.style.color           = good_color;
        message.innerHTML             = 'Passwords Match!';
        return true;
    	}
    	else
    	{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        //confirm.style.backgroundColor = bad_color;
        message.style.color           = bad_color;
        message.innerHTML             = 'Passwords Does Not Match!';
    	return false;
    	}
}  
}

function Validate() {
    var password = document.getElementById("pas1").value;
    var confirmPassword = document.getElementById("pas2").value;
    if (password != confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }
    return true;
}

function mf() {
	  var x = document.getElementById("pan");
	  x.value = x.value.toUpperCase();
	}


</script>

<%
Random ra = new Random();
int demo=ra.nextInt(10000);
%>
</head>

<body >
	<!-- title -->
	<h1>
		Validate Login & Register Forms
	</h1>
	<!-- //title -->

	<!-- content -->
	<div class="container-agille">
		<div class="formBox level-login">
			<div class="box boxShaddow"></div>
			<div class="box loginBox">
				<h3>Login Here</h3>
				<form class="form" action="Login1" method="post" autocomplete="off">
					<div class="f_row-2">
						<input type="email" class="input-field" placeholder="Email" name="em" required>
					</div>
					<div class="f_row-2 last">
						<input type="password" name="pw" placeholder="Password" class="input-field" required>
					</div>
					<input class="submit-w3" type="submit" value="Login">
					<div class="f_link">
						<a href="" class="resetTag">Forgot your password?</a>
					</div>
				</form>
			</div>
			
			<div class="box registerBox wthree">
				<span class="reg_bg"></span>
				<h3>Register</h3>
				<form class="form" action="Register" method="post" autocomplete=>
				<div class="f_row-2" >
						<input type="text" class="input-field"  name="id" value="<%=demo%>"  readonly>
					</div>
					<div class="f_row-2">
						<input type="text" class="input-field" placeholder="Username" name="name" required>
					</div>
					<div class="f_row-2">
						<input type="text" class="input-field" placeholder="Email" name="email" required>
					</div>
					<div class="f_row-2">
						<input type="text" class="input-field" placeholder="PhoneNumber" name="number" required>
					</div>
					<div class="f_row-2 last">
						<input type="password" name="pas" placeholder="Password" id="pass1" class="input-field" required>
					</div>
					<div class="f_row-2 last">
						<input type="password" name="cpassword" placeholder="Confirm Password" id="pass2" class="input-field" required>
					</div>
					<div class="f_row-2">
						
					<select name="enroll">
					<option value="" label="Select" selected="selected" >Select</option>
					<option>LAB</option>
					<option>DOCTOR</option>
					<option>STAFF</option>
					
					</select>
					</div>
					<input class="submit-w3" type="submit" value="Register">
				</form>
			</div>
			<a href="#" class="regTag icon-add">
				<i class="fa fa-repeat" aria-hidden="true"></i>

			</a>
		</div>
	</div>
	<!-- //content -->

	<!-- copyright -->
	<div class="footer-w3ls">
		<h2>
		</h2>
	</div>
	<!-- //copyright -->


	<!-- js files -->
	<!-- Jquery -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- //Jquery -->
	<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	</script>
	<!-- input fields js -->
	<script src="js/input-field.js"></script>
	<!-- //input fields js -->

	<!-- password-script -->
	<script>
		window.onload = function () {
			document.getElementById("pass1").onchange = validatePassword;
			document.getElementById("pass2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("pass2").value;
			var pass1 = document.getElementById("pass1").value;
			if (pass1 != pass2)
				document.getElementById("pass2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("pass2").setCustomValidity('');
			//empty string means no validation error
		}
	</script>
	<!-- //password-script -->
	<!-- //js files -->


</body>

</html>