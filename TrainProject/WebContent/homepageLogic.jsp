<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try{
    //connect to db
    ApplicationDB db = new ApplicationDB(); 
    Connection conn = db.getConnection();

    //logic goes here
        
    //close connection
    conn.close();
} catch(Exception e){
    out.print(e);
}
%>