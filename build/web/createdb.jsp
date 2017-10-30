<%-- 
    Document   : createdb
    Created on : Nov 21, 2013, 8:14:02 PM
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
                String table[] = new String[1];
                String index[] = new String[1];
                int count = 0;
                while (rst.next()) {
                    String title = rst.getString("title");
                    String id = (rst.getString("id"));

                    String text;
                    int i = 0, j = 0;
                    char[] chars = title.toCharArray();
                    int len = chars.length;
                    chars = Arrays.copyOf(chars, len + 2);
                    chars[len] = ' ';
                    chars[len + 1] = '\0';
                    while (chars[i] != '\0') {
                        while (chars[j] != ' ') {
                            j++;
                        }
                        int y;
                        text = new String(chars, i, (j - i));
                        for (y = 0; y < count; y++) {
                            if (table[y].equals(text)) {
                                index[y] = index[y] + ',' + id;
                                break;
                            }
                        }
                        if (y == count) {
                            table = Arrays.copyOf(table, count + 1);
                            table[count] = text;
                            index = Arrays.copyOf(index, count + 1);
                            index[count] = ','+ id;
                            count++;
                        }

                        i = j + 1;
                        j++;
                    }

                }
                sql = "DELETE FROM invindex";
                stmt.executeUpdate(sql);
                sql = "DELETE FROM ginixindex";
                stmt.executeUpdate(sql);
                String sea1,sea2;
                //create a Statement object 
                for (int i = 0; i < count; i++) {
                    //out.println(table[i] + " -         " + index[i]);
                    sea1=table[i];
                    sea2=index[i];
                String query = "insert into invindex values(?,?)";
                PreparedStatement prepStmt = connection.prepareStatement(query);
                prepStmt.setString(1, sea1);
                prepStmt.setString(2, sea2);
                prepStmt.executeUpdate();
                     }
                sql="select * from invindex";
                rst=stmt.executeQuery(sql);
        %><table cols="3" border="2"><tr><th>Keyword</th><th>Lower bound</th><th>Upper bound</th></tr><%
                while(rst.next())
                                       {
                    
                    char[] chars = rst.getString("invindex").toCharArray();
                    
                   
                     Common obj=new Common();
                    int []indexarr;
                    indexarr=obj.splitinteger(rst.getString("invindex"));
                    
                   int i;
                    
                   
                    Arrays.sort(indexarr);
                    int []intlist;
                    intlist=obj.convertinterval(indexarr);
                    
                    
                    
                   
                    int []lblist=new int[1];
                    int []ublist=new int[1];
                    int lcount=0,ucount=0;
                    for(i=0;intlist[i]!=-1;i++)
                                               {
                        lblist=Arrays.copyOf(lblist,lcount+1);
                        lblist[lcount]=intlist[i];
                        lcount++;
                        i++;
                        if(intlist[i]==-1)
                            break;
                        ublist=Arrays.copyOf(ublist,ucount+1);
                        ublist[ucount]=intlist[i];
                        ucount++;
                                               }
                    lblist=Arrays.copyOf(lblist,lcount+1);
                        lblist[lcount]=-1;
                        lcount++;
                        ublist=Arrays.copyOf(ublist,ucount+1);
                        ublist[ucount]=-1;
                        ucount++;
                    
                    
                  
                        String lbstring,ubstring;
                        lbstring=obj.convertstring(lblist);
                        ubstring=obj.convertstring(ublist);
                        
        %><tr>
            <td><%out.println(rst.getString("keyword"));%></td>
            <td><%out.println(lbstring);%></td>
            <td><%out.println(ubstring);%></td>
        </tr><%
                        String key;
                        key=rst.getString("keyword");
                String query = "insert into ginixindex values(?,?,?)";
                PreparedStatement prepStmt = connection.prepareStatement(query);
                prepStmt.setString(1, key);
                prepStmt.setString(2, lbstring);
                prepStmt.setString(3, ubstring);
                prepStmt.executeUpdate();
                    }
                    
                    
                }


                //out.println("Table created successfully!");
                //ArrayList<ArrayList<Integer>> array = new ArrayList<ArrayList<Integer>>();
             catch (Exception ex) {
                out.println(ex);
            }


        %>
        <a href="index.jsp">Back</a>
    </body>
</html>