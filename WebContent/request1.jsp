<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Data.util"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String status="Pending";
String remail=(String)session.getAttribute("mail");

String rid=(String)session.getAttribute("id");

String rname=(String)session.getAttribute("name");

String roll=(String)session.getAttribute("Role");

String fid = request.getParameter("req");

/* String perm = request.getParameter("permission");
System.out.print(perm); */

java.util.Date now = new java.util.Date();
String date=now.toString();
String DATE_FORMAT = "dd-MM-yyyy";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
String strDateNew = sdf.format(now) ;
Statement st = null;
ResultSet rs = null;
String rstime="Not Yet Responded";
try
{
Connection con=util.getconnection();
Connection con1=util.getconnection();
st=con.createStatement();
String qry =" select  * from fileup where fid ='"+fid+"'"; 

rs = st.executeQuery(qry);

if(rs.next()){
	String ownername = rs.getString("oname");
	String fname=rs.getString("fname");
	String omail = rs.getString("oemail");
	String oid = rs.getString("oid");
	
	PreparedStatement ps=con1.prepareStatement("insert into request(fname,fid,ownername,ownermail,ownerid,rname,rid,rmail,date,status,roll,rstime) values (?,?,?,?,?,?,?,?,?,?,?,?)");
	
	ps.setString(1,fname);
	ps.setString(2,fid);
	ps.setString(3,ownername);
	ps.setString(4,omail);
	ps.setString(5,oid);
	ps.setString(6,rname);
	ps.setString(7,rid);
	ps.setString(8,remail);
	ps.setString(9,strDateNew);
	ps.setString(10,status);
	ps.setString(11,roll);
	ps.setString(12,rstime);
	
	
	int x=ps.executeUpdate();
	System.out.println(fid);
	if(x!=0)
	{
		%>
		<script>
		alert("request send");
		window.location="request.jsp";
			</script>
		<% 
	}
	else
	{
		%>
		<script>
		alert("Try again");
		window.location="files.jsp";
			</script>
	<% 	
}
	
}
}
catch(Exception ex){
	out.println(ex);
}
	

%>
</body>
</html>