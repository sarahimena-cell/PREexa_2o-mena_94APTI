<%-- 
    Document   : filtro_waf
    Created on : 12/04/2026
    Author     : Nayeli Valdez (Mena Valdez Sarahi Nayeli)
--%>

<%@ page import="java.sql.*, java.util.*, java.util.regex.*" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
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
%>
        <html>
        <head>
            <title>WAF | INTREGITY_BREACH</title>
            <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;800&display=swap" rel="stylesheet">
            <style>
                body {
                    background-color: #0a0b10;
                    color: #ff007a;
                    font-family: 'JetBrains Mono', monospace;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    height: 100vh;
                    margin: 0;
                    text-align: center;
                }
                .waf-card {
                    border: 2px solid #ff007a;
                    padding: 3rem;
                    background: rgba(255, 0, 122, 0.05);
                    box-shadow: 0 0 30px rgba(255, 0, 122, 0.3);
                    border-radius: 20px;
                    max-width: 600px;
                }
                .glitch {
                    font-size: 3rem;
                    font-weight: 800;
                    text-transform: uppercase;
                    text-shadow: 0 0 15px #ff007a;
                    margin-bottom: 1rem;
                }
                .details {
                    color: #ffffff;
                    opacity: 0.8;
                    font-size: 0.9rem;
                    margin-top: 2rem;
                    border-top: 1px solid rgba(255, 255, 255, 0.1);
                    padding-top: 1rem;
                }
                .btn-return {
                    margin-top: 2rem;
                    display: inline-block;
                    color: #00f2ff;
                    text-decoration: none;
                    border: 1px solid #00f2ff;
                    padding: 10px 20px;
                    border-radius: 10px;
                    transition: 0.3s;
                }
                .btn-return:hover {
                    background: rgba(0, 242, 255, 0.1);
                    box-shadow: 0 0 15px #00f2ff;
                }
            </style>
        </head>
        <body>
            <div class="waf-card">
                <div class="glitch">⚠️ AMENAZA DETECTADA</div>
                <h2 style="color: #ffffff;">WAF_PROTECTION_LAYER_ACTIVE</h2>
                <p>Tu solicitud ha sido bloqueada y registrada por contener patrones de ataque identificados.</p>
                
                <div class="details">
                    IP_ORIGIN: <%= request.getRemoteAddr() %><br>
                    INCIDENT_TYPE: SQLi_XSS_PREVENTION<br>
                    TIMESTAMP: <%= new java.util.Date() %>
                </div>
                
                <a href="index.jsp" class="btn-return">VOLVER AL NODO SEGURO</a>
            </div>
        </body>
        </html>
<%
        return; // Detiene la ejecución del resto de la página
    }
%>