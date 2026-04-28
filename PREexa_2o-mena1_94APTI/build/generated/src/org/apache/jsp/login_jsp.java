package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>CiberLex | Login</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\">\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-light d-flex align-items-center vh-100\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"row justify-content-center\">\n");
      out.write("            <div class=\"col-md-4\">\n");
      out.write("                <div class=\"card shadow border-0\">\n");
      out.write("                    <div class=\"card-body p-5\">\n");
      out.write("                        <h3 class=\"text-center mb-4\">CiberLex Login</h3>\n");
      out.write("                        <form action=\"validar_login.jsp\" method=\"POST\">\n");
      out.write("                            <div class=\"mb-3\">\n");
      out.write("                                <label class=\"form-label\">Usuario</label>\n");
      out.write("                                <input type=\"text\" name=\"txtUser\" class=\"form-control\" required>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"mb-3\">\n");
      out.write("                                <label class=\"form-label\">Contraseña</label>\n");
      out.write("                                <input type=\"password\" name=\"txtPass\" class=\"form-control\" required>\n");
      out.write("                            </div>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary w-100\">Entrar al Panel</button>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
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
