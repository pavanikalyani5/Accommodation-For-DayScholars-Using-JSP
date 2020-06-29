
<%@page import="java.sql.ResultSet"%>
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
String A=request.getParameter("a");
String B=request.getParameter("b");
String C=request.getParameter("c");
String D=request.getParameter("d");
String E=request.getParameter("e");
String F=request.getParameter("f");
String G=request.getParameter("g");
String H=request.getParameter("h");
String I=request.getParameter("i");
String J=request.getParameter("j");
String rn=request.getParameter("a");//rn,na is variable ;rno,name is the name value of login.html
String na=request.getParameter("b");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pavani","root","");
	PreparedStatement ps= con.prepareStatement("insert into applications values('"+A+"','"+B+"','"+C+"','"+D+"','"+E+"','"+F+"','"+G+"','"+H+"','"+I+"','"+J+"','pending')");
	int i=ps.executeUpdate();
	if(i>0){
	%>
	<br>
	<center><h2 style="color:green">Successfully Submitted Application</h2></center>
	<% 
	}
}
catch(Exception s){
	System.out.println(s);
}
%>


</body>
</html>