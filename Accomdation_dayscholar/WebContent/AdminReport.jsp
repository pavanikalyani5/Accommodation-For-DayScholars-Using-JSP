<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	//here key value from LoginAction.jsp
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pavani","root","");
	PreparedStatement ps= con.prepareStatement("select * from applications where status='Accepted' ");  //sno , name are column name in db in cse table here s will be variable
	ResultSet rs=ps.executeQuery();
	%>
	<center><h3 style="background-color:skyblue;padding:20px;color:white ">ACCEPTED STUDENTS STATUS</h3></center>
	  <center>
		 <table border="3" style="color:white;background-color:black;border-color:skyblue">
		
		 <tr style="color:skyblue">
		 <th> REGISTER NO</th>
		 <th>NAME</th>
		 <th>BRANCH</th>
		 <th>YEAR</th>
		 <th>PARENT NO</th>
		 <th>EMail</th>
		 <th>REASON</th>
		 <th>HOSTEL NAME</th>
		 <th>ROOM NO</th>
		 <th>STAYING DATE</th>
		  <th>STATUS</th>
		  </tr>
		 <% 
	while(rs.next()){
		%>
		
		  <tr>
		  <td><%=rs.getString("rno")%></td>
		  <td><%=rs.getString("name")%></td>
		  <td><%=rs.getString("branch")%></td>
		  <td><%=rs.getString("year")%></td>
		  <td><%=rs.getString("mobile")%></td>
		  <td><%=rs.getString("email")%></td>
		  <td><%=rs.getString("reason")%></td>
		  <td><%=rs.getString("hostel")%></td>
		  <td><%=rs.getString("room")%></td>
		  <td><%=rs.getString("date")%></td>
		  <td style="color:green"><%=rs.getString("status")%></td>
			</tr>
			<%} %>
			</table></center>
			<%
		}
		catch(Exception s){
			System.out.println(s);
		}
		%>



</body>
</html>