<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
    try{
    	ApplicationDB db = new ApplicationDB();
		Connection conn = db.getConnection();
      	PreparedStatement ps = conn.prepareStatement("SELECT * FROM Customer WHERE username = ?");
      	ps.setString(1,request.getParameter("user"));
      	ResultSet rs = ps.executeQuery();
      	if(rs.first()){
			out.println("This username already exists.");
			String s = "<form method=\"get\" action=\"./registerPage.jsp\"><button type=\"submit\">Try Again</button></form>";
			out.print(s);
      	}else{  
			ps = conn.prepareStatement("INSERT INTO Customer(username,password,email,telephone,last_name, first_name,address,city,state,zip_code) VALUES (?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, request.getParameter("user"));
			ps.setString(2, request.getParameter("password"));
			ps.setString(3, request.getParameter("email"));
			ps.setString(4, request.getParameter("phone"));
			ps.setString(5, request.getParameter("lname"));
			ps.setString(6, request.getParameter("fname"));
			ps.setString(7, request.getParameter("address"));
			ps.setString(8, request.getParameter("city"));
			ps.setString(9, request.getParameter("state"));	
			ps.setString(10, request.getParameter("zipcode"));
			int result = ps.executeUpdate();
			out.print("Registration successful! You can now log in.");
			String s = "<form method=\"get\" action=\"./loginPage.jsp\"><button type=\"submit\">Log In</button></form>";
			out.println(s);
      	}
		conn.close();
    }catch (Exception e){
        System.out.println(e);
    }
%>
