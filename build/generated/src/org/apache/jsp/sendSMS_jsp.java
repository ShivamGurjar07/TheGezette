package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;

public final class sendSMS_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <pre>\n");
      out.write("            <form action=\"SmsController?op=sendmessage\" method=\"post\">\n");
      out.write("                Enter Number    <input type=\"text\" name=\"mobile\" required/>\n");
      out.write("                \n");
      out.write("                Enter Message :\n");
      out.write("                <textarea name=\"message\" rows=\"5\" cols=\"20\">\n");
      out.write("                    \n");
      out.write("                </textarea>\n");
      out.write("                <input type=\"submit\" name=\"submit\" value=\"send message\"/>\n");
      out.write("</form>\n");
      out.write("        </pre>            <form method=\"post\">\n");
      out.write("\n");
      out.write("        \n");
      out.write("        ");

            if(request.getParameter("submit")!=null){
                String mobile =request.getParameter("mobile");
                String message=request.getParameter("message");
                //Copy code from fastsms.com in quick api from get method
                HttpResponse <String>  response1 = Unirest.post("https://www.fast2sms.com/dev/bulkV2")
            .header("authorization", "Fg3lo2s6VpIDyJHfruztZTXAP7LaeO1SbCcKvWh8qjENmxRwY4dNMA6UT4euWpkCxPtDI9rhcsoZwa8B")
            .header("Content-Type", "application/x-www-form-urlencoded")
            .body("sender_id=TXTIND&message="+message+"&language=english&route=v3&numbers="+mobile)
            .asString();
                out.println(response1);
            }
            
            
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
