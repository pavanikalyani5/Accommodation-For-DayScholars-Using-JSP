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
</head>
<body>
<% 
        String rn=request.getParameter("a");//rn,na is variable ;rno,name is the name value of login.html
		String na=request.getParameter("b");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pavani","root","");
			PreparedStatement ps= con.prepareStatement("select * from student where regno='"+rn+"' and name='"+na+"'");  //sno , name are column name in db in cse table
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				session.setAttribute("key",rn);//here rn means sno it will be the to check the table
				response.sendRedirect("StudentPortal.jsp");
				
				
			}
			else{
				%>
				<h1>Wrong User</h1>
				<%
				}
				}
				catch(Exception s){
					System.out.println(s);
				}
		%>
</body>
</html>