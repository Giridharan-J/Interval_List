<%-- 
    Document   : viewdb
    Created on : Apr 8, 2014, 8:56:18 PM
    Author     : Giridharan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.mypackage.ginix.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Database creation</title>
    </head>
    <body> 
        <h3><center>Database</center></h3><br><br>
        <table cols="2" border="2">
            <tr>
                <th>ID</th>
            <th>Title</th>
        </tr>
        <%
            try {
                //Establishing JDBC Connection

                String connectionURL = "jdbc:mysql://localhost:3306/ginix";
                Connection connection = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement stmt = null;
                ResultSet rst = null;
                stmt = connection.createStatement();
                String sql = "select * from base;";
                rst = stmt.executeQuery(sql);
                while(rst.next())
                                       {
                    %><tr>
                        <td><%out.println(rst.getString("id"));%></td>
                       <td><%out.println(rst.getString("title"));%></td>
                    </tr>
                    <%
                }
                %></table><%
                               }
             catch (Exception ex) {
                out.println(ex);
            }


        %>
        <a href="index.jsp">Back</a>
    </body>
</html>