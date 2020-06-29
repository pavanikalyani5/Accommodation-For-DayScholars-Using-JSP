<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
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
<center><h3 style="background-color:skyblue;padding:20px;color:white ">STUDENT PORTAL</h3></center>

<div class="menu-bar">
<ul>
<li ><a href="index.html">Home</a></li>
<li><a href="outingapplication.html">Application</a></li>
<li><a href="OutingStudentStatus.jsp">Application Status</a></li>
<li><a href="StudentStatus.jsp">Profile</a></li>
<li><a href="studentlogin.html">Logout</a></li>
</ul>
</div>

<% 
try {
	String s=session.getAttribute("key").toString();//here key value from LoginAction.jsp
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pavani","root","");
	PreparedStatement ps= con.prepareStatement("select * from applications where rno='"+s+"'");  //sno , name are column name in db in cse table here s will be variable
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		%>
		<center><h3 style="background-color:skyblue;padding:20px;color:white ">STUDENT APPLICATION STATUS</h3></center>
		<center>
		 <table border="3" style="color:white;background-color:black;border-color:skyblue;">
		
		 <tr ><th style="color:skyblue"> REGISTER NO</th>
		 <th><%=rs.getString("rno")%></th></tr>
		  <tr> <th style="color:skyblue">  NAME</th>
		  <th><%=rs.getString("name")%></th></tr>
			<tr><th style="color:skyblue">BRANCH
			</th>
			<th><%=rs.getString("branch")%></th>
			</tr>
			<tr><th style="color:skyblue">YEAR
			</th>
			<th><%=rs.getString("year")%></th>
			</tr>
			<tr><th style="color:skyblue">PARENT NO
			</th>
			<th><%=rs.getString("mobile")%></th>
			</tr>
			<tr><th style="color:skyblue">EMail
			</th>
			<th><%=rs.getString("email")%></th>
			
			</tr>
			<tr><th style="color:skyblue">REASON
			</th>
			<th><%=rs.getString("reason")%></th>
			</tr>
			<tr><th style="color:skyblue">HOSTEL NAME
			</th>
			<th><%=rs.getString("hostel")%></th>
			</tr>
			<tr><th style="color:skyblue">ROOM NO
			</th>
			<th><%=rs.getString("room")%></th>
			</tr>
			<tr><th style="color:skyblue">STAYING DATE
			</th>
			<th><%=rs.getString("date")%></th>
			</tr>
			<tr><th style="color:skyblue">STATUS
			</th>
			<th style="color:green"><%=rs.getString("status")%></th>
			</tr>
			</table>
			</center>
			<%
		}
		}
		catch(Exception s){
			System.out.println(s);
		}
		%>
</body>
</html>