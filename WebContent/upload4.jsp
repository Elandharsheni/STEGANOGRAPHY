<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="Data.util"%>

<%
/* String email1=(String)session.getAttribute("email1");  */
String oname=null,oemail=null,role=null,fid=null,image=null,data=null,key=null,fname=null,oid=null;
		Statement st = null;
		ResultSet rs1=null;
		int iid=0,count=0;
		
	
		ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery2");
		String paramname=null;
		String file=null;

		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy HH:mm:ss";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("name"))
				{
					oname=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("email"))
				{
					oemail=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("en"))
				{
					role=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("fileid"))
				{
					fid=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				
				if(paramname.equalsIgnoreCase("data"))
				{
					data=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("key"))
				{
					key=multi.getParameter(paramname);
				}
				 if(paramname.equalsIgnoreCase("fname"))
				{
					fname=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("id"))
				{
					oid=multi.getParameter(paramname);
				}
				
				
				}
			
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery2\\"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
	
			Connection con=util.getconnection();

			PreparedStatement ps=con.prepareStatement("INSERT INTO fileup VALUES(?,?,?,?,?,?,?,?,?,?)");
			
           	ps.setString(1,oid);
			ps.setString(2,oname);
			ps.setString(3,oemail);	
   			ps.setString(4,role);
   			ps.setString(5,fid);  
   			ps.setString(6,image);
		    ps.setString(7,data);
		    ps.setString(8,key);
		    ps.setString(9,strDateNew);
		    ps.setString(10,fname);
			   				
				
       if(f == 0)
			ps.setObject(6,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(6,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{%>
			<script>
			alert("Upload successfully");
			window.location="doctor.jsp";
				</script>
			<% }
			else
			{
				%>
				<script>
				alert("Upload error");
				window.location="upload4.jsp";
					</script>
		<% 	}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
			
 %>

	
 
