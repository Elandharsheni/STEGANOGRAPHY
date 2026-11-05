<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Data.util"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email = request.getParameter("uemail");
String fileid = request.getParameter("id");
out.print(fileid);

java.util.Date now = new java.util.Date();
String date=now.toString();
String DATE_FORMAT = "dd-MM-yyyy";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
String strDateNew = sdf.format(now) ;

String status = "Responded";
Statement st = null;
ResultSet rs = null;



Connection con2=util.getconnection();
st=con2.createStatement();
String sql2 = "select * from fileup where FID ='"+ fileid +"'" ;
rs=st.executeQuery(sql2);
String fkey="";
if(rs.next()){
fkey = rs.getString("key");

}

 

String nn="Active";

String host="", user="", pass="";

host ="smtp.gmail.com"; //"smtp.gmail.com";

user ="lingeshk.surya@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

pass ="peukodyuzigblhxo"; //Your gmail password

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

String to =email; // out going email id

String from ="lingeshk.surya@gmail.com"; //Email id of the recipient
String subject= "Secret Key To Access the Data";
//String subject ="welcome";

String messageText ="Confidential Key  : " + fkey;


//session.setAttribute("emailid",emailid);
boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());


 
 %>
<script type="text/javascript">
    alert("Key sent to the User");
<%


}
catch (Exception err) {

out.println("message not successfully sended"); // assume it’s a fail
}
transport.close();


	
	// Create statement object
	Statement stmt = con2.createStatement();

	// Set auto-commit to false
	con2.setAutoCommit(false);
	
	String SQL = " update request set status='"+ status +"',rstime='"+ strDateNew +"' where fid='"+fileid+"'";
	//Add above SQL statement in the batch.
	stmt.addBatch(SQL);
	// Create an int[] to hold returned values
	int[] count = stmt.executeBatch();

	//Explicitly commit statements to apply changes
	con2.commit();
%>	
	
window.location="requestlist.jsp";

</script><body>
</html>