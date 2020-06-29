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
</head>
<body>
<%
String rn=request.getParameter("rno");
String na=request.getParameter("name");
String em=request.getParameter("email");
String bn=request.getParameter("branch");
String mob=request.getParameter("mobile");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pavani","root","");
	PreparedStatement ps= con.prepareStatement("insert into student values('"+rn+"','"+na+"','"+em+"','"+bn+"','"+mob+"')");
	int i=ps.executeUpdate();
	if(i>0){
		response.sendRedirect("studentlogin.html");
	}
	else{
		response.sendRedirect("studentreg.html");
	}
}
catch(Exception s){
	System.out.println(s);
}
%>
</body>
</html>