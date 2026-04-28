<%-- 1. BLOQUE DE SEGURIDAD PARA ADMINS --%>
<%
    if (session.getAttribute("session_usuario") == null
            || !"admin".equals(session.getAttribute("session_rol"))) {
        response.sendRedirect("index.jsp?error=acceso_denegado");
        return;
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CiberLex | Carga de Inteligencia</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&family=JetBrains+Mono&display=swap" rel="stylesheet">
        
        <style>
            body { 
                background-color: #0a0b10; 
                font-family: 'Plus Jakarta Sans', sans-serif; 
                color: #ffffff; 
                height: 100vh;
                display: flex;
                align-items: center;
            }
            
            .card-cyber { 
                background-color: #161b22; 
                border: 1px solid #00f2ff; 
                border-radius: 20px; 
                box-shadow: 0 0 30px rgba(0, 242, 255, 0.15);
            }
            
            .card-header {
                background-color: #0d1117;
                border-bottom: 1px solid #00f2ff;
                border-radius: 20px 20px 0 0 !important;
            }

            .form-label { 
                color: #00f2ff; 
                font-family: 'JetBrains Mono', monospace;
                font-size: 0.8rem;
                letter-spacing: 1px;
            }

            .form-control, .form-select {
                background-color: #0d1117 !important;
                border: 1px solid #30363d !important;
                color: #ffffff !important;
                border-radius: 12px;
            }

            .form-control:focus, .form-select:focus {
                border-color: #ff007a !important;
                box-shadow: 0 0 10px rgba(255, 0, 122, 0.3);
            }

            .btn-cyber-primary {
                background: linear-gradient(45deg, #00f2ff, #7000ff);
                border: none;
                color: white;
                font-weight: 800;
                border-radius: 12px;
                transition: 0.3s;
            }

            .btn-cyber-primary:hover {
                box-shadow: 0 0 20px rgba(0, 242, 255, 0.5);
                transform: translateY(-2px);
                color: white;
            }

            .btn-cyber-outline {
                border: 1px solid #30363d;
                color: #ffffff;
                background: transparent;
                border-radius: 12px;
            }
            
            .btn-cyber-outline:hover {
                background: #21262d;
                color: #00f2ff;
            }
            
            ::placeholder { color: #4b5563 !important; }
        </style>
    </head>
    <body class="container">
        <div class="row justify-content-center w-100">
            <div class="col-md-10 col-lg-8">
                <div class="card card-cyber">
                    <div class="card-header p-4">
                        <h3 class="mb-0 fw-800" style="color: #00f2ff; text-shadow: 0 0 10px rgba(0,242,255,0.4);">
                            <i class="bi bi-shield-plus"></i> INYECTAR RECURSO
                        </h3>
                        <p class="small mb-0 opacity-75" style="font-family: 'JetBrains Mono';">NODE_AUTH: ADMIN_ACCESS_GRANTED</p>
                    </div>
                    <div class="card-body p-4">
                        <form action="guardar.jsp" method="POST">
                            <div class="row">
                                <div class="col-md-8 mb-4">
                                    <label class="form-label fw-bold">TÍTULO DEL RECURSO</label>
                                    <input type="text" name="titulo" class="form-control form-control-lg" 
                                           placeholder="Ej: Implementación de WAF Cloudflare" required>
                                </div>

                                <div class="col-md-4 mb-4">
                                    <label class="form-label fw-bold">CATEGORÍA_TAG</label>
                                    <select name="categoria" class="form-select form-select-lg">
                                        <option value="legislacion">⚖️ LEGISLACIÓN</option>
                                        <option value="tip_tecnico">🛠️ TECH_TIP</option>
                                        <option value="consejo">💡 CONSEJO</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-bold">CONTENIDO_DATA (SUPPORT_HTML)</label>
                                <textarea name="contenido" class="form-control" rows="6" 
                                          placeholder="<b>RESTRICCIÓN:</b> ... <br><b>SOLUCIÓN:</b> ..." required></textarea>
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <a href="index.jsp" class="btn btn-cyber-outline px-4">
                                    <i class="bi bi-chevron-left"></i> CANCELAR
                                </a>
                                <button type="submit" class="btn btn-cyber-primary px-5 py-2">
                                    SUBIR A CIBERLEX_DB <i class="bi bi-send-fill ms-2"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="text-center mt-4 opacity-50" style="font-size: 0.7rem; font-family: 'JetBrains Mono';">
                    ENCRYPTION_LAYER: ACTIVE // SESSION_TOKEN: VERIFIED
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>