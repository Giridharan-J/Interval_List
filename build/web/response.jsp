<%-- 
    Document   : response
    Created on : Sep 16, 2013, 8:10:26 AM
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
String query = "select * from ginixindex where keyword = ? OR keyword = ? ";
PreparedStatement prepStmt = connection.prepareStatement(query);
prepStmt.setString(1, sea1);
prepStmt.setString(2, sea2);
rst = prepStmt.executeQuery();
//rst=stmt.executeQuery("select * from ginindex where keyword=sea1 OR keyword=sea2");
int []lower=new int[100];
int []upper=new int[100];

int i=0,j=0;
Common cobj=new Common();
while(rst.next())
    {
    
    //Getting the lower and upper indices in separate arrays
    int []lowertemp;
    int []uppertemp;
    int k=0;
    
    lowertemp=cobj.splitinteger(rst.getString("lower"));
    uppertemp=cobj.splitinteger(rst.getString("upper"));
    
    for(k=0;lowertemp[k]!=32767;j++)
               {
        lower[j]=lowertemp[k];
        upper[j]=uppertemp[k];
        k++;
               }
    }
int countarr=j; 
out.println("You searched for : "+sea1+"    "+sea2);
%><br><br><%
 
int k=0;
int []arr;

arr=cobj.join(lower,upper,countarr);
Union unobj=new Union();
int []result;
result=unobj.ScanLineUnion(arr,lower,upper);
long timer=unobj.get_time();
int []finres;
finres=cobj.convert(result);
int []finalarr;
 finalarr=cobj.remdup(finres);
 int count;
for(count=0;finalarr[count]!='\0';count++);     
%>  

           <h3>Search results</h3>
<%
ResultSet rs=null;
Statement smt=null;
smt = connection.createStatement(); //create a Statement object 
rs=smt.executeQuery("select * from base ");
int id;
while(rs.next())
       {
    id=Integer.parseInt(rs.getString("id"));
    for(i=0;i<count;i++)
               {
               if(finalarr[i]==id)
                   {
                   String title=rs.getString("title");
                   out.println(id+"---"+title);
                   %><br><%
                   }     
                 }  
         }
out.println("Time taken="+timer);
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
