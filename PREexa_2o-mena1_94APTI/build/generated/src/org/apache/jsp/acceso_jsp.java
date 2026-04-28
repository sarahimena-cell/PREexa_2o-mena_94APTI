package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class acceso_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>CiberLex | Authenticator</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;800&family=JetBrains+Mono&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                background-color: #0a0b10;\n");
      out.write("                height: 100vh;\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                justify-content: center;\n");
      out.write("                font-family: 'Plus Jakarta Sans', sans-serif;\n");
      out.write("                color: #fff;\n");
      out.write("                overflow: hidden;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-card {\n");
      out.write("                background: #161b22;\n");
      out.write("                padding: 3rem;\n");
      out.write("                border-radius: 24px;\n");
      out.write("                border: 1px solid #00f2ff;\n");
      out.write("                box-shadow: 0 0 40px rgba(0, 242, 255, 0.2);\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 420px;\n");
      out.write("                position: relative;\n");
      out.write("                z-index: 1;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-card h2 {\n");
      out.write("                color: #00f2ff;\n");
      out.write("                text-shadow: 0 0 15px rgba(0, 242, 255, 0.6);\n");
      out.write("                font-weight: 800;\n");
      out.write("                margin-bottom: 2rem;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-control {\n");
      out.write("                background: #0d1117;\n");
      out.write("                border: 1px solid #30363d;\n");
      out.write("                color: white;\n");
      out.write("                border-radius: 12px;\n");
      out.write("                padding: 12px;\n");
      out.write("                transition: 0.3s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-control:focus {\n");
      out.write("                background: #0d1117;\n");
      out.write("                color: #fff;\n");
      out.write("                border-color: #ff007a;\n");
      out.write("                box-shadow: 0 0 15px rgba(255, 0, 122, 0.3);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-auth {\n");
      out.write("                background: linear-gradient(45deg, #00f2ff, #7000ff);\n");
      out.write("                border: none;\n");
      out.write("                color: white;\n");
      out.write("                font-weight: 800;\n");
      out.write("                padding: 12px;\n");
      out.write("                border-radius: 12px;\n");
      out.write("                width: 100%;\n");
      out.write("                margin-top: 1rem;\n");
      out.write("                letter-spacing: 1px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-auth:hover {\n");
      out.write("                transform: scale(1.02);\n");
      out.write("                box-shadow: 0 0 25px rgba(112, 0, 255, 0.5);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Efecto de fondo sutil */\n");
      out.write("            .bg-glow {\n");
      out.write("                position: absolute;\n");
      out.write("                width: 300px;\n");
      out.write("                height: 300px;\n");
      out.write("                background: radial-gradient(circle, rgba(0, 242, 255, 0.1) 0%, transparent 70%);\n");
      out.write("                top: -50px;\n");
      out.write("                left: -50px;\n");
      out.write("                z-index: -1;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"login-card\">\n");
      out.write("            <div class=\"bg-glow\"></div>\n");
      out.write("            <h2>CiberLex ACCESS</h2>\n");
      out.write("            <form action=\"login_process.jsp\" method=\"POST\">\n");
      out.write("                <div class=\"mb-3\">\n");
      out.write("                    <label class=\"small text-muted mb-2\">IDENTIFICADOR</label>\n");
      out.write("                    <input type=\"text\" name=\"usuario\" class=\"form-control\" required placeholder=\"admin_user\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"mb-4\">\n");
      out.write("                    <label class=\"small text-muted mb-2\">PASSKEY</label>\n");
      out.write("                    <input type=\"password\" name=\"password\" class=\"form-control\" required placeholder=\"••••••••\">\n");
      out.write("                </div>\n");
      out.write("                <button type=\"submit\" class=\"btn btn-auth\">INICIAR PROTOCOLO</button>\n");
      out.write("            </form>\n");
      out.write("            <p class=\"text-center mt-4 small text-muted\" style=\"font-family: 'JetBrains Mono';\">v3.6.1 // SECURE_GATEWAY</p>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
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
