<%@ page import="java.sql.*,Data.util"%>
<%@ page import="java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<% Blob image = null;

Connection con = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;
String id=request.getParameter("fid");

try {

	con=util.getconnection();

stmt = con.createStatement();

rs = stmt.executeQuery("select image from fileup where fid = '"+id+"' ");

if (rs.next()) {

image = rs.getBlob(1);

imgData = image.getBytes(1,(int)image.length());

} else {

out.println("Display Blob Example");

out.println("image not found for given image");

return;

}

// display the image

response.setContentType("image/gif");

OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();

} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} /* finally {

 try {

rs.close();

stmt.close();

con.close();

}  Xcatch (SQLException e) {

e.printStackTrace();

} 

}*/
%> 