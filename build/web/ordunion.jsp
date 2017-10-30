<%-- 
    Document   : ordunion
    Created on : Dec 31, 2013, 1:42:49 PM
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
        <title>Search results</title>
    </head>
    <body>    
<% 
try 
{
    //Establishing JDBC Connection
String connectionURL = "jdbc:mysql://localhost:3306/ginix"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");
%>
<br>
<%
//Getting values from textboxes
String sea1=request.getParameter("search1");
String sea2=request.getParameter("search2");
ResultSet rst=null;
 //create a Statement object 
String query = "select * from invindex where keyword = ? OR keyword = ? ";
PreparedStatement prepStmt = connection.prepareStatement(query);
prepStmt.setString(1, sea1);
prepStmt.setString(2, sea2);
rst = prepStmt.executeQuery();
//rst=stmt.executeQuery("select * from ginindex where keyword=sea1 OR keyword=sea2");
int []key1;
int []key2;
int []res;
Common cobj=new Common();
Union uobj=new Union();
rst.next();
key1=cobj.splitinteger(rst.getString("invindex"));
rst.next();
key2=cobj.splitinteger(rst.getString("invindex"));
res=uobj.naiveunion(key1,key2);
long time=uobj.get_time();
int count;
for(count=0;res[count]!='\0';count++);
%><h3>Search results</h3><%
ResultSet rs=null;
Statement smt=null;
smt = connection.createStatement(); //create a Statement object 
rs=smt.executeQuery("select * from base ");
int id;
while(rs.next())
       {
    id=Integer.parseInt(rs.getString("id"));
    for(int i=0;i<count;i++)
               {
               if(res[i]==id)
                   {
                   String title=rs.getString("title");
                   out.println(id+"---"+title);
                   %><br><%
                   }     
                 }  
         }
out.println("Time taken:"+time);
}
catch(Exception ex){
%>
</font>
<font size="+3" color="red"></b>
<%
out.println(ex);
}
%>
</font>
</body> 
</html> 

