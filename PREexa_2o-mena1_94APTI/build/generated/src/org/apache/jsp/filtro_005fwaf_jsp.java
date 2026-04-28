package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.regex.*;

public final class filtro_005fwaf_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    // Configuración de tu BD (Asegurando puerto 3307 como indicaste)
    String dbUrl = "jdbc:mysql://localhost:3307/preexamenapti"; 
    String dbUser = "root";
    String dbPass = "";

    // 1. Patrones de ataque (Blacklist)
    String[] blacklistedPatterns = {
        "(?i)<script.*?>.*?</script.*?>", 
        "(?i)UNION\\s+SELECT",             
        "(?i)OR\\s+['\"]?\\d+['\"]?\\s*=\\s*['\"]?\\d+['\"]?", 
        "(?i)DROP\\s+TABLE",               
        "(?i)javascript:",
        "(?i)SELECT\\s+.*\\s+FROM",
        "(?i)DELETE\\s+FROM"
    };

    // 2. Análisis de parámetros
    Enumeration<String> paramNames = request.getParameterNames();
    boolean attackDetected = false;
    String offendingPayload = "";

    while (paramNames.hasMoreElements()) {
        String paramName = paramNames.nextElement();
        String paramValue = request.getParameter(paramName);

        for (String pattern : blacklistedPatterns) {
            if (paramValue != null && Pattern.compile(pattern).matcher(paramValue).find()) {
                attackDetected = true;
                offendingPayload = paramName + "=" + paramValue;
                break;
            }
        }
        if (attackDetected) break;
    }

    // 3. Bloqueo y Registro en DB con Estética CiberLex
    if (attackDetected) {
        try {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            
            String sql = "INSERT INTO t_sucesos (ip_address, payload, attack_type) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getRemoteAddr());
            pstmt.setString(2, offendingPayload);
            pstmt.setString(3, "WAF_BLOCK: Malicious Pattern Detected");
            pstmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            // Error silencioso en producción, pero útil para ti en desarrollo
            System.err.println("WAF_DB_LOG_ERROR: " + e.getMessage());
        }

        // Pantalla de Bloqueo Estilo CiberLex 2026

      out.write("\n");
      out.write("        <html>\n");
      out.write("        <head>\n");
      out.write("            <title>WAF | INTREGITY_BREACH</title>\n");
      out.write("            <link href=\"https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;800&display=swap\" rel=\"stylesheet\">\n");
      out.write("            <style>\n");
      out.write("                body {\n");
      out.write("                    background-color: #0a0b10;\n");
      out.write("                    color: #ff007a;\n");
      out.write("                    font-family: 'JetBrains Mono', monospace;\n");
      out.write("                    display: flex;\n");
      out.write("                    align-items: center;\n");
      out.write("                    justify-content: center;\n");
      out.write("                    height: 100vh;\n");
      out.write("                    margin: 0;\n");
      out.write("                    text-align: center;\n");
      out.write("                }\n");
      out.write("                .waf-card {\n");
      out.write("                    border: 2px solid #ff007a;\n");
      out.write("                    padding: 3rem;\n");
      out.write("                    background: rgba(255, 0, 122, 0.05);\n");
      out.write("                    box-shadow: 0 0 30px rgba(255, 0, 122, 0.3);\n");
      out.write("                    border-radius: 20px;\n");
      out.write("                    max-width: 600px;\n");
      out.write("                }\n");
      out.write("                .glitch {\n");
      out.write("                    font-size: 3rem;\n");
      out.write("                    font-weight: 800;\n");
      out.write("                    text-transform: uppercase;\n");
      out.write("                    text-shadow: 0 0 15px #ff007a;\n");
      out.write("                    margin-bottom: 1rem;\n");
      out.write("                }\n");
      out.write("                .details {\n");
      out.write("                    color: #ffffff;\n");
      out.write("                    opacity: 0.8;\n");
      out.write("                    font-size: 0.9rem;\n");
      out.write("                    margin-top: 2rem;\n");
      out.write("                    border-top: 1px solid rgba(255, 255, 255, 0.1);\n");
      out.write("                    padding-top: 1rem;\n");
      out.write("                }\n");
      out.write("                .btn-return {\n");
      out.write("                    margin-top: 2rem;\n");
      out.write("                    display: inline-block;\n");
      out.write("                    color: #00f2ff;\n");
      out.write("                    text-decoration: none;\n");
      out.write("                    border: 1px solid #00f2ff;\n");
      out.write("                    padding: 10px 20px;\n");
      out.write("                    border-radius: 10px;\n");
      out.write("                    transition: 0.3s;\n");
      out.write("                }\n");
      out.write("                .btn-return:hover {\n");
      out.write("                    background: rgba(0, 242, 255, 0.1);\n");
      out.write("                    box-shadow: 0 0 15px #00f2ff;\n");
      out.write("                }\n");
      out.write("            </style>\n");
      out.write("        </head>\n");
      out.write("        <body>\n");
      out.write("            <div class=\"waf-card\">\n");
      out.write("                <div class=\"glitch\">⚠️ AMENAZA DETECTADA</div>\n");
      out.write("                <h2 style=\"color: #ffffff;\">WAF_PROTECTION_LAYER_ACTIVE</h2>\n");
      out.write("                <p>Tu solicitud ha sido bloqueada y registrada por contener patrones de ataque identificados.</p>\n");
      out.write("                \n");
      out.write("                <div class=\"details\">\n");
      out.write("                    IP_ORIGIN: ");
      out.print( request.getRemoteAddr() );
      out.write("<br>\n");
      out.write("                    INCIDENT_TYPE: SQLi_XSS_PREVENTION<br>\n");
      out.write("                    TIMESTAMP: ");
      out.print( new java.util.Date() );
      out.write("\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <a href=\"index.jsp\" class=\"btn-return\">VOLVER AL NODO SEGURO</a>\n");
      out.write("            </div>\n");
      out.write("        </body>\n");
      out.write("        </html>\n");

        return; // Detiene la ejecución del resto de la página
    }

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
