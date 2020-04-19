<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>

<html>
   <head>
      <title>Display Current Date & Time</title>
   </head>
   
   <body>
      <center>
         <h1>Display Current Date & Time</h1>
      </center>
      <%
         Date dNow = new Date( );
         SimpleDateFormat ft = 
         new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
         out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
      %>
   </body>