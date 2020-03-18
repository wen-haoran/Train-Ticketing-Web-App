<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>

<%
    try{
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();
      PreparedStatement ps = conn.prepareStatement("SELECT * FROM user WHERE " +
              "username = ?");
      ps.setString(1,request.getParameter("user"));
      ResultSet rs = ps.executeQuery();
      if(rs.first()){
          out.print("This username already exists.");
      }else{
				String queryString = "INSERT INTO customer(user,password,fname,lname,email,
						phone,address,city,state,zipcode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
						ps.setString(2, requestgetParameter("password"));
						ps.setString(3, requestgetParameter("fname"));
						ps.setString(4, requestgetParameter("lname"));
						ps.setString(5, requestgetParameter("email"));
						ps.setString(6, requestgetParameter("phone"));
						ps.setString(7, requestgetParameter("address"));
						ps.setString(8, requestgetParameter("city"));
						ps.setString(9, requestgetParameter("state"));
						ps.setInt(10, requestgetParameter("zipcode"));
						int update = pstatement.executeUpdate();
          out.print("Registration successful! You may now log in.");
      }
			conn.close();
    }catch (Exception e){
        System.out.println(e);
    }
%>
