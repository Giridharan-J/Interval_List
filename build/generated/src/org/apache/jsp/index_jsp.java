package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \n");
      out.write("\"http://www.w3.org/TR/html4/loose.dtd\"> \n");
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("<html>  \n");
      out.write("<head> \n");
      out.write("<title>GINIX</title> \n");
      out.write("</head> \n");
      out.write("<body bgcolor=\"pink\">\n");
      out.write("    <center><h1><font color=\"blue\">GINIX SEARCH</font></h1></center><br>\n");
      out.write("    ");
      out.write("\n");
      out.write("    <form name=\"form3\" action=\"ordunion.jsp\">\n");
      out.write("        <center><input type=\"text\" name=\"search1\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" name=\"search2\"><br><br></center>\n");
      out.write("        <center><input type=\"submit\" name=\"subunion\" value=\"Search any\"></center>\n");
      out.write("    </form>\n");
      out.write("     <br/>\n");
      out.write("    <form name=\"form4\" action=\"ordint.jsp\">\n");
      out.write("        <center><input type=\"text\" name=\"search1\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" name=\"search2\"><br><br></center>\n");
      out.write("        <center><input type=\"submit\" name=\"subunion\" value=\"Search all\"></center>\n");
      out.write("    </form>\n");
      out.write("     <br/>\n");
      out.write("<marquee>\n");
      out.write("    <img src=\"/images/download(3).jpg\" width=\"20\" height=\"40\" >\n");
      out.write("</marquee>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
