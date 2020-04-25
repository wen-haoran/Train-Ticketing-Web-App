<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 
	try{
		//At this point we are checking if the username or ssn are duplicates if not update the employee information
			ApplicationDB db = new ApplicationDB();
			Connection conn = db.getConnection();

			PreparedStatement ps;
			ResultSet rs;
			if(request.getParameter("fieldEmployeeUsername").equals(request.getParameter("editEmployeeUsername"))){
				ps = conn.prepareStatement("SELECT * FROM Employee WHERE username = ?");
		      	ps.setString(1,request.getParameter("fieldEmployeeUsername"));
		      	rs = ps.executeQuery();
				if(rs.first()){
					String s = "<form method=\"get\" action=\"./editEmployee.jsp\">Username already used<button type=\"submit\">Try again</button></form>";
		      		out.print(s);
		      		conn.close();
		      		return;
				}
			}else if(request.getParameter("fieldEmployeeSSN").equals(request.getParameter("editEmployeeSSN"))){
				ps= conn.prepareStatement("SELECT * FROM Employee WHERE ssn LIKE ?");
		      	ps.setString(1,request.getParameter("fieldEmployeeSSN"));
		      	rs = ps.executeQuery();
		      	if(rs.first()){
		      		String s = "<form method=\"get\" action=\"./editEmployee.jsp\">Employee already exits<button type=\"submit\">Try again</button></form>";
		      		out.print(s);
		      		conn.close();
		      		return;
		      	}
			}
			ps = conn.prepareStatement("UPDATE Employee SET username = ?, password = ?, first_name = ?, last_name = ?, ssn= ?, access_level = ? WHERE username = ?");
			ps.setString(1, request.getParameter("fieldEmployeeUsername"));
			ps.setString(2, request.getParameter("fieldEmployeePassword"));
			ps.setString(3, request.getParameter("fieldEmployeeFirst_name"));
			ps.setString(4, request.getParameter("fieldEmployeeLast_name"));
			ps.setString(5, request.getParameter("fieldEmployeeSSN"));
			ps.setString(6, request.getParameter("fieldEmployeeAccess_level"));
			ps.setString(7, request.getParameter("editEmployeeUsername"));
			ps.executeUpdate();
			String s = "<form method=\"get\" action=\"./admin.jsp\">Successfully Updated Employees<button type=\"submit\">Go back</button></form>";
      		out.print(s);
			conn.close();
	}catch(Exception e){
		 System.out.println(e);
	}
%>