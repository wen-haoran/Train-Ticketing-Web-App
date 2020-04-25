<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
    try{
    	ApplicationDB db = new ApplicationDB();
		Connection conn = db.getConnection();
      	PreparedStatement ps = conn.prepareStatement("SELECT * FROM Employee WHERE username = ?");
      	ps.setString(1,request.getParameter("employeeUsername"));
      	ResultSet rs = ps.executeQuery();
      	PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM Employee WHERE ssn = ?");
      	ps2.setString(1,request.getParameter("employeeSSN"));
      	ResultSet rs2 = ps2.executeQuery();
      	if(rs.first()){
			out.println("This username already exists.");
			String s = "<form method=\"get\" action=\"./admin.jsp\"><button type=\"submit\">Return</button></form>";
			out.print(s);
      	}else if(rs2.first()){
      		out.println("This user already exists.");
			String s = "<form method=\"get\" action=\"./admin.jsp\"><button type=\"submit\">Return</button></form>";
			out.print(s);
      	}else{  
      		PreparedStatement ps3 = conn.prepareStatement("INSERT INTO Employee(username, password, first_name, last_name, ssn, access_level) VALUES (?,?,?,?,?,?)");
			ps3.setString(1, request.getParameter("employeeUsername"));
			ps3.setString(2, request.getParameter("employeePassword"));
			ps3.setString(3, request.getParameter("employeeFirst_name"));
			ps3.setString(4, request.getParameter("employeeLast_name"));
			ps3.setString(5, request.getParameter("employeeSSN"));
			ps3.setString(6, request.getParameter("employeeAccess_level"));	
			int result = ps3.executeUpdate();
			out.print("Successful Registration of Employee");
			String s = "<form method=\"get\" action=\"./admin.jsp\"><button type=\"submit\">Return</button></form>";
			out.println(s);
      	}
		conn.close();
    }catch (Exception e){
        System.out.println(e);
    }
%>