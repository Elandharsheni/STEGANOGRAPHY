<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Data.util"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/style-starter.css" type="text/css" media="all" />
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/stylet.css">

    <title>Files</title>
    <style type="text/css">
    body{
	 height:680px;
	 background-image: url("images/b.jpg");
	 background-repeat: no-repeat; 
	 background-attachment: fixed;
	 background-position: center; 
	 background-size: 100%;
	}
    </style>
    
  </head>
  
  <body>
  	           <!--header-->
  <section class="w3l-header">
    <header id="site-header" class="fixed-top">
      <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark stroke">
          <h1><a class="navbar-brand" href="index.html">
              <span class="fa fa-search"></span>Doctor
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
                <a class="nav-link" href="doctor.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="files.jsp">Files</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="request.jsp">Request</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="decrypt.jsp">Decrypt</a>
              </li>
                <li class="nav-item">
                <a class="nav-link" href="upload3.jsp">Upload</a>
              </li>
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

  <div class="content">
    
    <div class="container">

      <h2 class="mb-5" style="text-align=center;"></h2>

      <div class="table-responsive">

        <table class="table table-striped custom-table">
          <thead>
            <tr>
             
              <th scope="col">FILENAME</th>
              <th scope="col">FILEID</th>
              <th scope="col">NAME</th>
              <th scope="col">ID</th>
              <th scope="col">MAIL</th>
              <th scope="col">DATE</th>
             <th scope="col">STATUS</th>
              <th scope="col">RESPONDED DATE</th>
            </tr>
          </thead>
          <tbody>
           <%
		String s="DOCTOR";
		Statement st = null;
		ResultSet rs = null;


		try
					{
					Connection con=util.getconnection();
					st=con.createStatement();
					String qry ="select  * from request where roll='"+s+"'"; 
					rs = st.executeQuery(qry);
					while(rs.next())
					{
									
				%>
         
            <tr scope="row" class="active">
            <td><%=rs.getString("fname") %></td>
            <td><%=rs.getString("fid")%></td>
            <td><%=rs.getString("rname")%></td>
            <td><%=rs.getString("rid")%></td>
            <td><%=rs.getString("rmail")%></td>
           <td><%=rs.getString("date")%></td>
           <td><%=rs.getString("status")%></td>
            <td><%=rs.getString("rstime")%></td>
            </tr>
           <%
					}
            }
            catch(Exception ex){
            	out.println(ex);
            }
            	
            	%>
            
          </tbody>
        </table>
      </div>
      
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
    </div>

  </div>
    
    

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>