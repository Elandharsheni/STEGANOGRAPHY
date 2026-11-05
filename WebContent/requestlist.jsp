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
          <h1><a class="navbar-brand" href="#">
              <span class="fa fa-search"></span>Admin
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
                <a class="nav-link" href="admin.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="employee.jsp">Employee</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="requestlist.jsp">RequestList</a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="filesview.jsp">Files</a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="index.html">Logout</a>
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
              <th scope="col">FID</th>
              <th scope="col">FName</th>
              <th scope="col">OwnerName</th>
              <th scope="col">RID</th>
              <th scope="col">RName</th>
              <th scope="col">REmail</th>
              <th scope="col">Date</th>
              <th scope="col">Status</th>
              <th scope="col">Action</th>
            </tr>
          </thead>
          <tbody>
         <%

Statement st = null;
ResultSet rs = null;



	
try
			{
			Connection con=util.getconnection();
			st=con.createStatement();
	String qry =" select  * from request "; 
	rs = st.executeQuery(qry);
	/* String id="";
	session.setAttribute("FILEID", id); */
	
	while(rs.next())
	{
		String FILEID = rs.getString("fid");
		session.setAttribute("fid", FILEID);
	 //String FILEID = rs.getString("FILEID");
	%>
	  <tbody>
	     <tr> 
             <td> <%=rs.getString("fid")%> </td>
             <td> <%=rs.getString("fname")%> </td>
             <td> <%=rs.getString("ownername")%> </td>
             <td> <%=rs.getString("rid")%> </td>
             <td> <%=rs.getString("rname")%> </td>
             <td> <%=rs.getString("rmail")%> </td>
             <td> <%=rs.getString("date")%> </td>
             <td> <%=rs.getString("status")%> </td>           
             <td><a href="Keysend.jsp?id=<%=FILEID%>&&uemail=<%=rs.getString("rmail") %>" style="color:red;font-weight:bold;text-decoration:underline;font-size:20px;">SEND KEY</a>
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