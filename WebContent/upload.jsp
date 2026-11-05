<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Data.util"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>upload</title>
<!-- metatags-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="wedlock register form a Flat Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<script>
   function eraseText() {
    document.getElementById("output").value = "";
}
   function func(){
		document.getElementById("fid").value = Math.floor(Math.random() * 10000)+ 123;
		document.getElementById("keys").value = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);}s
</script>
<style>
input[type=file]{
		  width: 80%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  box-sizing: border-box;
		  border: 3px solid #555;
		  -webkit-transition: 0.5s;
		  transition: 0.5s;
		  outline: none;
		  
		}

		

</style>
<!-- Meta tag Keywords -->
<!-- css -->
<link rel="stylesheet" href="css/styleu.css" type="text/css" media="all" />
<link rel="stylesheet" href="assets/css/style-starter.css" type="text/css" media="all" />
<!--// css -->
<link href="//fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Philosopher" rel="stylesheet">
</head>
<body onload = "func()">
           <!--header-->
  <section class="w3l-header">
    <header id="site-header" class="fixed-top">
      <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark stroke">
          <h1><a class="navbar-brand" href="index.html">
              <span class="fa fa-search"></span>Lab
            </a></h1>
          <!-- if logo is image enable this   
    <a class="navbar-brand" href="#index.html">
        <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
    </a> -->
          <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
            data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
            <span class="navbar-toggler-icon fa icon-close fa-times"></span>
            </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="Lab.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="upload.jsp">Upload</a>
              </li>
             <!--  <li class="nav-item">
                <a class="nav-link" href="services.html">Doctor</a>
              </li> -->
              <li class="nav-item">
                <a class="nav-link" href="index.html">Logout</a>
              </li>
             </ul>
          </div>
          <!-- toggle switch for light and dark theme -->
          <div class="mobile-position">
            <nav class="navigation">
              <div class="theme-switch-wrapper">
                <label class="theme-switch" for="checkbox">
                  <input type="checkbox" id="checkbox">
                  <div class="mode-container py-1">
                    <i class="gg-sun"></i>
                    <i class="gg-moon"></i>
                  </div>
                </label>
              </div>
            </nav>
          </div>
          <!-- //toggle switch for light and dark theme -->
        </nav>
      </div>
    </header>
    </section>
    <!--/header-->
    <br>
    <br>
    <br>
    <br>
    <br>
	<section class="agile-header">
		<div class="agile-heading">
			<h1><span class="image"></span><label>U</label>p<label>l</label>oad form</h1>
		</div>
		<%
		String n=(String)session.getAttribute("mail");
		//out.print( "Welcome"+ n);
		Statement st = null;
		ResultSet rs = null;


		try
					{
					Connection con=util.getconnection();
					st=con.createStatement();
					String qry =" select  * from register where email = '" + n +"'"; 
					rs = st.executeQuery(qry);
					if(rs.next())
					{
					int oid=rs.getInt("id");
				   // session.setAttribute("oid",oid);
				    String enroll=rs.getString("enroll");
				   // session.setAttribute("roll",enroll);
				    String name=rs.getString("name");
					}
				  /*  // out.print( "ID :"+ oid);
	 				}
					
		/* catch(Exception ex){
						out.println(ex);
					} */
/* 	//HttpSession session=request.getSession(false);  
  String oid =(String)session.getAttribute("oid");
    
	Statement st1 = null;
	ResultSet rs1 = null;
	
	try
	{
	Connection con=util.getconnection();
	st1=con.createStatement();
String qry1 =" select  * from register where id = '" + oid +"'"; 
//out.print(oid);
rs1 = st.executeQuery(qry1);
while(rs1.next())
{	 */
	
	%>
		<div class="agile-form">
			<form action="upload2.jsp" method="post"  enctype="multipart/form-data" autocomplete="off">
			<td><input type="hidden" value=<%= rs.getString("id") %> name="id"></td>
			<td><input type="hidden" value=<%= rs.getString("name") %> name="name"></td>
		<tr><td><input type="hidden" value=<%= rs.getString("email") %> name="email"></td></tr>
		<tr><td><input type="hidden" value=<%= rs.getString("enroll") %> name="en"></td></tr>
			<tr><th>FILE ID</th><td><input  type="text"  name="fileid" id="fid" readonly></td></tr>
				 <tr><th>FILE NAME</th><td><input  type="text"  name="fname" required="" ></td></tr>
				<tr><th>FILE    </th><td><input  type="file" name="image" id="filetoRead" required=""></td></tr>
				<br>
				<div class="agile-password">
					<p>Type Message to Hide</p>
					<!-- <input type="text"  name="data" required="" style="font-size: 10pt; height: 100px; width:280px; "> -->
					<textarea name="data" id="data" rows="4" cols="50"></textarea>
					
				 <input type="button" value="Clear" onclick="javascript:eraseText();"> 
				</div>
				<br>
						<tr><th>KEY</th><td><input  type="text"  name="key" id="keys" readonly></td></tr>	
				<div class="agile-submit">
					<input type="submit" value="ENCRYPT">
				</div>
			</form>
		</div>
		<div class="clear"></div>
	</section>
	 <br>
    <br>
    <br>
    <br>
    <br>
    <%
}
catch(Exception ex){
	out.println(ex);
}
	
	%>
	  <script src="assets/js/jquery-3.3.1.min.js"></script>
	<script src="assets/js/theme-change.js"></script>

  <script src="assets/js/owl.carousel.js"></script>
	  <script src="assets/js/jquery.waypoints.min.js"></script>
  <script src="assets/js/jquery.countup.js"></script>
 <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>