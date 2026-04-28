package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.regex.*;
import java.sql.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/filtro_waf.jsp");
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

      out.write('\n');

    if (session.getAttribute("session_usuario") == null) {
        response.sendRedirect("acceso.jsp");
        return;
    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>CiberLex | Neural Dashboard</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&family=JetBrains+Mono&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <style>\n");
      out.write("        body { \n");
      out.write("            background-color: #0a0b10; \n");
      out.write("            font-family: 'Plus Jakarta Sans', sans-serif; \n");
      out.write("            color: #ffffff; \n");
      out.write("            overflow-x: hidden; \n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .header-cyber {\n");
      out.write("            background-color: #161b22;\n");
      out.write("            border-bottom: 1px solid #00f2ff;\n");
      out.write("            box-shadow: 0 0 20px rgba(0, 242, 255, 0.15);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .card-custom { \n");
      out.write("            background-color: #161b22 !important; \n");
      out.write("            border: 1px solid rgba(255,255,255,0.1) !important; \n");
      out.write("            border-radius: 20px; \n");
      out.write("            transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .card-custom:hover { \n");
      out.write("            border-color: #00f2ff !important; \n");
      out.write("            box-shadow: 0 0 20px rgba(0, 242, 255, 0.2);\n");
      out.write("            transform: translateY(-5px);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .search-box { \n");
      out.write("            background-color: #0d1117 !important; \n");
      out.write("            border: 1px solid #30363d !important; \n");
      out.write("            color: #ffffff !important; \n");
      out.write("            border-radius: 14px; \n");
      out.write("            padding-left: 45px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .filter-btn { \n");
      out.write("            background-color: #21262d; \n");
      out.write("            border: 1px solid #30363d; \n");
      out.write("            color: #ffffff; \n");
      out.write("            border-radius: 12px; \n");
      out.write("            font-weight: 600; \n");
      out.write("            margin-right: 5px;\n");
      out.write("            transition: 0.3s;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .filter-btn.active { \n");
      out.write("            background-color: #00f2ff; \n");
      out.write("            color: #000000; \n");
      out.write("            border-color: #00f2ff; \n");
      out.write("            box-shadow: 0 0 10px rgba(0, 242, 255, 0.4);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .news-feed { \n");
      out.write("            background-color: #161b22; \n");
      out.write("            border: 1px solid #7000ff; \n");
      out.write("            border-radius: 20px; \n");
      out.write("            padding: 24px; \n");
      out.write("            position: sticky; \n");
      out.write("            top: 20px;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .news-item a { \n");
      out.write("            text-decoration: none; \n");
      out.write("            color: #ffffff; \n");
      out.write("            font-size: 0.85rem; \n");
      out.write("            font-family: 'JetBrains Mono', monospace; \n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .news-item a:hover { color: #00f2ff; text-shadow: 0 0 5px #00f2ff; }\n");
      out.write("        .news-date { color: #00f2ff; font-size: 0.7rem; margin-bottom: 4px; }\n");
      out.write("        \n");
      out.write("        .recurso-contenido {\n");
      out.write("            color: #cbd5e1 !important; \n");
      out.write("            line-height: 1.6;\n");
      out.write("            font-size: 0.9rem;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body class=\"container py-4\">\n");
      out.write("\n");
      out.write("    <header class=\"header-cyber p-4 rounded-4 mb-5 d-flex justify-content-between align-items-center\">\n");
      out.write("        <div>\n");
      out.write("            <h1 class=\"h2 mb-0 fw-800\" style=\"color: #00f2ff; text-shadow: 0 0 10px rgba(0,242,255,0.4);\">CiberLex <span style=\"color: #ff007a;\">2026</span></h1>\n");
      out.write("            <p class=\"small mb-0\" style=\"font-family: 'JetBrains Mono'; color: #ffffff;\">NODE_STATUS: <span class=\"text-success\">ENCRYPTED_AND_SECURE</span></p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"d-flex align-items-center gap-3\">\n");
      out.write("            <div class=\"text-end\">\n");
      out.write("                <p class=\"mb-0 fw-bold small\" style=\"color: #ffffff;\">");
      out.print( session.getAttribute("session_usuario"));
      out.write("</p>\n");
      out.write("                <span class=\"badge border border-info text-info\" style=\"font-size: 0.6rem;\">ADMIN_VERIFIED</span>\n");
      out.write("            </div>\n");
      out.write("            <a href=\"logout.jsp\" class=\"btn btn-outline-danger rounded-circle p-2\"><i class=\"bi bi-power\"></i></a>\n");
      out.write("        </div>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("    <div class=\"row g-4\">\n");
      out.write("        <div class=\"col-lg-9\">\n");
      out.write("            ");
      out.write("\n");
      out.write("            <div class=\"row g-3 mb-4 align-items-center\">\n");
      out.write("                <div class=\"col-md-8 position-relative\">\n");
      out.write("                    <i class=\"bi bi-search position-absolute\" style=\"left: 25px; top: 12px; color: #00f2ff;\"></i>\n");
      out.write("                    <input type=\"text\" id=\"busqueda\" class=\"form-control search-box\" placeholder=\"Escanear base de datos...\" onkeyup=\"buscarRecurso()\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-4 text-end\">\n");
      out.write("                    ");
 if ("admin".equals(session.getAttribute("session_rol"))) { 
      out.write("\n");
      out.write("                        <a href=\"nuevo_tip.jsp\" class=\"btn btn-info fw-bold w-100\" style=\"background-color: #00f2ff; border:none; color:#000; border-radius:12px;\">+ NUEVO REGISTRO</a>\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("            <div class=\"d-flex gap-2 mb-5 overflow-x-auto pb-2\">\n");
      out.write("                <button class=\"btn filter-btn active\" onclick=\"filtrar('todos', this)\">TODOS</button>\n");
      out.write("                <button class=\"btn filter-btn\" onclick=\"filtrar('legislacion', this)\">LEGAL</button>\n");
      out.write("                <button class=\"btn filter-btn\" onclick=\"filtrar('tip_tecnico', this)\">TECH_TIPS</button>\n");
      out.write("                <button class=\"btn filter-btn\" onclick=\"filtrar('consejo', this)\">CONSEJOS</button>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row g-4\" id=\"contenedor-recursos\">\n");
      out.write("                ");

                    try {
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM recursos_seguridad ORDER BY id_recurso DESC");
                        while (rs.next()) {
                            String id = rs.getString("id_recurso");
                            String cont = rs.getString("contenido");
                            String cat = rs.getString("categoria").toLowerCase();
                            
                            String nColor = "#00f2ff"; 
                            if (cat.contains("legis")) { nColor = "#ff007a"; } 
                            else if (cat.contains("cons")) { nColor = "#7000ff"; } 
                
      out.write("\n");
      out.write("                <div class=\"col-md-6 recurso-card\" data-categoria=\"");
      out.print( cat.trim() );
      out.write("\">\n");
      out.write("                    <div class=\"card h-100 card-custom border-top border-4\" style=\"border-top-color: ");
      out.print( nColor );
      out.write(" !important;\">\n");
      out.write("                        <div class=\"card-body d-flex flex-column p-4\">\n");
      out.write("                            <div class=\"d-flex justify-content-between mb-3 align-items-center\">\n");
      out.write("                                <span class=\"badge\" style=\"background-color: ");
      out.print( nColor );
      out.write("; color: #000; font-size: 0.65rem;\">");
      out.print( cat.toUpperCase() );
      out.write("</span>\n");
      out.write("                                \n");
      out.write("                                ");
 if ("admin".equals(session.getAttribute("session_rol"))) { 
      out.write("\n");
      out.write("                                <div class=\"dropdown\">\n");
      out.write("                                    <button class=\"btn btn-link text-white p-0\" type=\"button\" data-bs-toggle=\"dropdown\">\n");
      out.write("                                        <i class=\"bi bi-three-dots-vertical\"></i>\n");
      out.write("                                    </button>\n");
      out.write("                                    <ul class=\"dropdown-menu dropdown-menu-dark shadow border-secondary\">\n");
      out.write("                                        <li><a class=\"dropdown-item\" href=\"editar.jsp?id=");
      out.print( id );
      out.write("\"><i class=\"bi bi-pencil-square me-2\"></i>Editar</a></li>\n");
      out.write("                                        <li><hr class=\"dropdown-divider border-secondary\"></li>\n");
      out.write("                                        <li><a class=\"dropdown-item text-danger\" href=\"eliminar.jsp?id=");
      out.print( id );
      out.write("\" onclick=\"return confirm('¿Eliminar recurso?')\"><i class=\"bi bi-trash me-2\"></i>Eliminar</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                                </div>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <h5 class=\"fw-bold mb-3 titulo-recurso\" style=\"color: ");
      out.print( nColor );
      out.write("; text-shadow: 0 0 5px rgba(0,0,0,0.5);\">");
      out.print( rs.getString("titulo"));
      out.write("</h5>\n");
      out.write("                            <div class=\"recurso-contenido flex-grow-1\">");
      out.print( cont );
      out.write("</div>\n");
      out.write("                            \n");
      out.write("                            <div class=\"mt-4\">\n");
      out.write("                                ");
 
                                    int startIdx = cont.indexOf("https://");
                                    if (startIdx == -1) startIdx = cont.indexOf("http://");
                                    if (startIdx != -1) {
                                        String url = cont.substring(startIdx).trim();
                                
      out.write("\n");
      out.write("                                    <a href=\"");
      out.print( url );
      out.write("\" target=\"_blank\" class=\"btn btn-sm w-100 fw-bold\" \n");
      out.write("                                       style=\"color: ");
      out.print( nColor );
      out.write("; border: 1px solid ");
      out.print( nColor );
      out.write("; background: transparent; border-radius: 10px;\">\n");
      out.write("                                       ");
      out.print( url.contains("youtube") ? "REPRODUCIR MEDIA" : "ABRIR FUENTE" );
      out.write("\n");
      out.write("                                    </a>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                ");

                        }
                    } catch (Exception e) { out.print("Error: " + e.getMessage()); }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        <div class=\"col-lg-3\">\n");
      out.write("            <div class=\"news-feed shadow-sm\">\n");
      out.write("                <h6 class=\"fw-bold mb-4 text-center\" style=\"color: #7000ff; text-shadow: 0 0 8px rgba(112, 0, 255, 0.4);\">\n");
      out.write("                    <i class=\"bi bi-lightning-charge-fill me-2\"></i>LIVE_INTELLIGENCE\n");
      out.write("                </h6>\n");
      out.write("                <div id=\"rss-feed-container\">\n");
      out.write("                    <div class=\"text-center py-4\">\n");
      out.write("                        <div class=\"spinner-border text-info spinner-border-sm\" role=\"status\"></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        function filtrar(cat, btn) {\n");
      out.write("            document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));\n");
      out.write("            btn.classList.add('active');\n");
      out.write("            document.querySelectorAll('.recurso-card').forEach(c => {\n");
      out.write("                const cardCat = c.getAttribute('data-categoria');\n");
      out.write("                c.classList.toggle('d-none', cat !== 'todos' && cardCat !== cat);\n");
      out.write("            });\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        function buscarRecurso() {\n");
      out.write("            let input = document.getElementById('busqueda').value.toLowerCase();\n");
      out.write("            let cards = document.querySelectorAll('.recurso-card');\n");
      out.write("            cards.forEach(card => {\n");
      out.write("                let titulo = card.querySelector('.titulo-recurso').innerText.toLowerCase();\n");
      out.write("                card.classList.toggle('d-none', !titulo.includes(input));\n");
      out.write("            });\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        async function cargarRSS() {\n");
      out.write("            var RSS_URL = 'https://thehackernews.com/feeds/posts/default?alt=rss';\n");
      out.write("            var container = document.getElementById('rss-feed-container');\n");
      out.write("            try {\n");
      out.write("                var response = await fetch('https://api.rss2json.com/v1/api.json?rss_url=' + encodeURIComponent(RSS_URL));\n");
      out.write("                var data = await response.json();\n");
      out.write("                if (data.status === 'ok') {\n");
      out.write("                    container.innerHTML = '';\n");
      out.write("                    data.items.slice(0, 6).forEach(function(item) {\n");
      out.write("                        var div = document.createElement('div');\n");
      out.write("                        div.className = 'news-item mb-3 border-bottom border-secondary pb-2';\n");
      out.write("                        var fecha = new Date(item.pubDate).toLocaleDateString('es-MX', {day:'numeric', month:'short'});\n");
      out.write("                        div.innerHTML = '<div class=\"news-date\">' + fecha + '</div>' +\n");
      out.write("                                        '<a href=\"' + item.link + '\" target=\"_blank\">' + item.title + '</a>';\n");
      out.write("                        container.appendChild(div);\n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("            } catch (e) { container.innerHTML = '<small class=\"text-muted\">Offline Mode</small>'; }\n");
      out.write("        }\n");
      out.write("        window.onload = cargarRSS;\n");
      out.write("    </script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\n");
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
