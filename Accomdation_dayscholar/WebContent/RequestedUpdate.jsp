<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<center><h3 style="background-color:skyblue;padding:20px;color:white ">ADMIN PORTAL</h3></center>

<div class="menu-bar">
<ul>
<li ><a href="index.html">Home</a></li>
<li><a href="RequestAction.jsp">Applications Requests</a></li>
<li><a href="AdminReport.jsp">Application Status</a></li>
<li><a href="AdminProfile.jsp">Profile</a></li>
<li><a href="adminlogin.html">Logout</a></li>
</ul>
</div>
<%

try {
	String s=request.getParameter("as");
	String r=request.getParameter("regno");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pavani","root","");
	PreparedStatement ps= con.prepareStatement("update applications set status='"+s+"' where rno='"+r+"' ");
	int i=ps.executeUpdate();
	if(i>0){
		%>
		<br><center><h3 style="color=green">SUCCESSFULLY SUBMITED</h3></center>
		<%
	}
}
catch(Exception s){
	System.out.println(s);
}


%>

</body>
</html>