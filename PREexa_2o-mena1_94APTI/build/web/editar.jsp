<%-- 1. BLOQUE DE SEGURIDAD PARA ADMINS --%>
<%
    if(session.getAttribute("session_usuario") == null || 
       !"admin".equals(session.getAttribute("session_rol"))) {
        
        response.sendRedirect("index.jsp?error=acceso_denegado");
        return;
    }
%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="conexion.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Recurso | CiberLex</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&family=JetBrains+Mono&display=swap" rel="stylesheet">
    
    <style>
        body { 
            background-color: #0a0b10; 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            color: #ffffff; 
            min-height: 100vh;
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
            font-weight: 600;
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

        .btn-update {
            background: linear-gradient(45deg, #00f2ff, #7000ff);
            border: none;
            color: white;
            font-weight: 800;
            border-radius: 12px;
            transition: 0.3s;
        }

        .btn-update:hover {
            box-shadow: 0 0 20px rgba(0, 242, 255, 0.5);
            transform: translateY(-2px);
            color: white;
        }

        .btn-cancel {
            border: 1px solid #30363d;
            color: #ffffff;
            background: transparent;
            border-radius: 12px;
        }
        
        .btn-cancel:hover {
            background: #21262d;
            color: #ff007a;
            border-color: #ff007a;
        }
    </style>
</head>
<body class="container py-5">
    <div class="row justify-content-center w-100">
        <div class="col-md-8">
            <div class="card card-cyber">
                <div class="card-header p-4">
                    <h4 class="mb-0 fw-800" style="color: #00f2ff; text-shadow: 0 0 10px rgba(0,242,255,0.4);">
                        <i class="bi bi-pencil-square"></i> MODIFICAR INTELIGENCIA
                    </h4>
                    <p class="small mb-0 opacity-75" style="font-family: 'JetBrains Mono';">EDIT_MODE: <span style="color: #ffc107;">REWRITING_DATABASE</span></p>
                </div>
                <div class="card-body p-4">
                    <%
                        String idParam = request.getParameter("id");
                        
                        // Procesar actualización si es POST
                        if (request.getMethod().equalsIgnoreCase("POST")) {
                            String nuevoTitulo = request.getParameter("titulo");
                            String nuevaCat = request.getParameter("categoria");
                            String nuevoContenido = request.getParameter("contenido");
                            
                            try {
                                PreparedStatement ps = con.prepareStatement(
                                    "UPDATE recursos_seguridad SET titulo=?, categoria=?, contenido=? WHERE id_recurso=?");
                                ps.setString(1, nuevoTitulo);
                                ps.setString(2, nuevaCat);
                                ps.setString(3, nuevoContenido);
                                ps.setInt(4, Integer.parseInt(idParam));
                                
                                int filas = ps.executeUpdate();
                                if(filas > 0) {
                                    response.sendRedirect("index.jsp");
                                }
                            } catch (Exception e) {
                                out.println("<div class='alert alert-danger bg-dark text-danger border-danger'>ERROR_SYSTEM_FAILURE: " + e.getMessage() + "</div>");
                            }
                        }

                        // Cargar datos actuales
                        try {
                            PreparedStatement ps = con.prepareStatement("SELECT * FROM recursos_seguridad WHERE id_recurso = ?");
                            ps.setInt(1, Integer.parseInt(idParam));
                            ResultSet rs = ps.executeQuery();
                            
                            if(rs.next()) {
                                String dbCat = rs.getString("categoria");
                    %>
                    <form method="POST">
                        <div class="mb-4">
                            <label class="form-label">TÍTULO_RECURSO</label>
                            <input type="text" name="titulo" class="form-control form-control-lg" value="<%= rs.getString("titulo") %>" required>
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label">CATEGORÍA_DATA</label>
                            <select name="categoria" class="form-select form-select-lg">
                                <option value="Legislación" <%= dbCat.equalsIgnoreCase("Legislación") ? "selected" : "" %>>⚖️ LEGISLACIÓN</option>
                                <option value="Tip Técnico" <%= dbCat.equalsIgnoreCase("Tip Técnico") ? "selected" : "" %>>🛠️ TECH_TIP</option>
                                <option value="Consejo" <%= dbCat.equalsIgnoreCase("Consejo") ? "selected" : "" %>>💡 CONSEJO</option>
                            </select>
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label">CONTENIDO_DATA_ENCRYPTED</label>
                            <textarea name="contenido" class="form-control" rows="6" required><%= rs.getString("contenido") %></textarea>
                        </div>
                        
                        <div class="d-flex justify-content-between">
                            <a href="index.jsp" class="btn btn-cancel px-4">
                                <i class="bi bi-x-circle"></i> CANCELAR
                            </a>
                            <button type="submit" class="btn btn-update px-5">
                                ACTUALIZAR_NODO <i class="bi bi-save-fill ms-2"></i>
                            </button>
                        </div>
                    </form>
                    <% 
                            } else {
                                out.println("<div class='alert alert-warning bg-dark text-warning border-warning'>404: DATA_NOT_FOUND</div>");
                            }
                        } catch (Exception e) {
                            out.println("<div class='text-danger'>SYSTEM_ERROR: " + e.getMessage() + "</div>");
                        }
                    %>
                </div>
            </div>
            <div class="text-center mt-4 opacity-50" style="font-size: 0.65rem; font-family: 'JetBrains Mono';">
                LOG: EDIT_REQUEST_BY_<%= session.getAttribute("session_usuario") %> // ADM_VERIFIED
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>