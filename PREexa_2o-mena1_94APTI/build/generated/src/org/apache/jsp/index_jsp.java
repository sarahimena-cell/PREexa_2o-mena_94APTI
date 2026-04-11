package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/conexion.jsp");
  }

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

      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write(" ");
      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");

    // Declaramos la variable para que sea visible en todo el archivo
    Connection con = null; 
    
    try {
        // Driver actualizado para MySQL 8.0+
        Class.forName("com.mysql.jdbc.Driver"); 
        
        // URL con parámetros de compatibilidad
        String url = "jdbc:mysql://localhost:3307/preexamenapti?useSSL=false&serverTimezone=UTC";
        
        con = DriverManager.getConnection(url, "root", "");
        
        if(con != null) {
            System.out.println("¡CONEXIÓN EXITOSA A MYSQL!"); 
        }
    } catch (Exception e) {
        out.print("Error en conexión: " + e.getMessage());
        e.printStackTrace(); // Esto enviará el error detallado a la consola de NetBeans
    }

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>CiberLex | Panel de Administración</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\">\n");
      out.write("    <style>\n");
      out.write("        .text-truncate-custom {\n");
      out.write("            max-width: 300px;\n");
      out.write("            white-space: nowrap;\n");
      out.write("            overflow: hidden;\n");
      out.write("            text-overflow: ellipsis;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body class=\"container mt-5\">\n");
      out.write("    <div class=\"d-flex justify-content-between align-items-center mb-4\">\n");
      out.write("        <h2>Gestión de Ciberseguridad Empresarial</h2>\n");
      out.write("        <a href=\"nuevo_tip.jsp\" class=\"btn btn-success\">+ Agregar Recurso</a>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <table class=\"table table-hover table-bordered shadow-sm\">\n");
      out.write("        <thead class=\"table-dark\">\n");
      out.write("            <tr>\n");
      out.write("                <th>ID</th>\n");
      out.write("                <th>Título</th>\n");
      out.write("                <th>Categoría</th>\n");
      out.write("                <th>Contenido</th>\n");
      out.write("                <th>Última Modificación</th>\n");
      out.write("                <th>Acciones</th>\n");
      out.write("            </tr>\n");
      out.write("        </thead>\n");
      out.write("        <tbody>\n");
      out.write("            ");

                try {
                    Statement st = con.createStatement();
                    // Usamos la tabla definida anteriormente: recursos_seguridad
                    ResultSet rs = st.executeQuery("SELECT * FROM recursos_seguridad ORDER BY id_recurso DESC");
                    
                    while(rs.next()) {
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td><strong>#");
      out.print( rs.getInt("id_recurso") );
      out.write("</strong></td>\n");
      out.write("                <td>");
      out.print( rs.getString("titulo") );
      out.write("</td>\n");
      out.write("                <td>\n");
      out.write("                    <span class=\"badge bg-primary\">\n");
      out.write("                        ");
      out.print( rs.getString("categoria") );
      out.write("\n");
      out.write("                    </span>\n");
      out.write("                </td>\n");
      out.write("                <td class=\"text-truncate-custom\">\n");
      out.write("                    ");
      out.print( rs.getString("contenido") );
      out.write("\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <small class=\"text-muted\">");
      out.print( rs.getTimestamp("ultima_modificacion") );
      out.write("</small>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <div class=\"btn-group\" role=\"group\">\n");
      out.write("                        <a href=\"editar.jsp?id=");
      out.print( rs.getInt("id_recurso") );
      out.write("\" class=\"btn btn-sm btn-warning\">Editar</a>\n");
      out.write("                        <a href=\"eliminar.jsp?id=");
      out.print( rs.getInt("id_recurso") );
      out.write("\" \n");
      out.write("                           class=\"btn btn-sm btn-danger\" \n");
      out.write("                           onclick=\"return confirm('¿Está seguro de eliminar este registro legal/técnico?')\">\n");
      out.write("                           Borrar\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            ");
 
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error al cargar datos: " + e.getMessage() + "</div>");
                }
            
      out.write("\n");
      out.write("        </tbody>\n");
      out.write("    </table>\n");
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
