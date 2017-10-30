<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>  
<head> 
<title>GINIX</title> 
</head> 
<body>
    <center><h1><font color="blue">GINIX Search</font></h1></center><br>
     
    <form name="create" action="viewdb.jsp">
        <center><input type="submit" value="View Database"></center>
    </form>
    <br>
    <form name="create" action="createdb.jsp">
        <center><input type="submit" value="Create Ginix Inteval Lists"></center>
    </form>
    
     <div style="float: left; width:50%;">
    <form name="form1" action="response.jsp">
        <br><br><center><h1>GINIX Search</h1></center><br><br><br>
        <center><input type="text" name="search1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="search2"><br><br></center>
        <center><input type="submit" name="subunion" value="Search any"></center>
        <br>
    </form>
         
    <form name="form2" action="responseint.jsp">
        <center><input type="text" name="search1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="search2"><br><br></center>
        <center><input type="submit" name="subunion" value="Search all"></center>
    </form>
     </div>
     <div style="float: right; width:50%;">
    <br><br><center><h1>InvIndex</h1></center><br><br><br>
            </td>
            <td>
                
    <form name="form3" action="ordunion.jsp">
        <center><input type="text" name="search1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="search2"><br><br></center>
        <center><input type="submit" name="subunion" value="Search any"></center>
    </form>
     <br/>
    <form name="form4" action="ordint.jsp">
        <center><input type="text" name="search1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="search2"><br><br></center>
        <center><input type="submit" name="subunion" value="Search all"></center>
    </form>
     <br/>
                
           
</body>
</html>