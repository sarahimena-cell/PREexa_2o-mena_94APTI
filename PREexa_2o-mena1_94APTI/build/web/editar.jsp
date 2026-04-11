<%-- 
    Document   : editar
    Created on : 9/04/2026, 11:52:29 AM
    Author     : Nayeli
--%>

<%-- 
    Document   : editar
    Created on : 9/04/2026
    Author     : Nayeli
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="conexion.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Recurso | CiberLex</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-warning text-dark">
                        <h4 class="mb-0">Actualizar Información de Seguridad</h4>
                    </div>
                    <div class="card-body">
                        <%
                            // 1. Obtener el ID de la URL
                            String idParam = request.getParameter("id");
                            
                            // 2. Si se envió el formulario (POST), procesar la actualización
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
                                        response.sendRedirect("index.jsp"); // Redirigir al éxito
                                    }
                                } catch (Exception e) {
                                    out.println("<div class='alert alert-danger'>Error al actualizar: " + e.getMessage() + "</div>");
                                }
                            }

                            // 3. Cargar los datos actuales para mostrarlos en el formulario
                            try {
                                PreparedStatement ps = con.prepareStatement("SELECT * FROM recursos_seguridad WHERE id_recurso = ?");
                                ps.setInt(1, Integer.parseInt(idParam));
                                ResultSet rs = ps.executeQuery();
                                
                                if(rs.next()) {
                        %>
                        <form method="POST">
                            <div class="mb-3">
                                <label class="form-label">Título del Recurso</label>
                                <input type="text" name="titulo" class="form-control" value="<%= rs.getString("titulo") %>" required>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Categoría</label>
                                <select name="categoria" class="form-select">
                                    <option value="Consejo" <%= rs.getString("categoria").equals("Consejo") ? "selected" : "" %>>Consejo</option>
                                    <option value="Tip Técnico" <%= rs.getString("categoria").equals("Tip Técnico") ? "selected" : "" %>>Tip Técnico</option>
                                    <option value="Legislación" <%= rs.getString("categoria").equals("Legislación") ? "selected" : "" %>>Legislación</option>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Contenido Detallado</label>
                                <textarea name="contenido" class="form-control" rows="6" required><%= rs.getString("contenido") %></textarea>
                            </div>
                            
                            <div class="d-flex justify-content-between">
                                <a href="index.jsp" class="btn btn-secondary">Cancelar</a>
                                <button type="submit" class="btn btn-warning">Guardar Cambios</button>
                            </div>
                        </form>
                        <% 
                                } else {
                                    out.println("<div class='alert alert-warning'>Registro no encontrado.</div>");
                                }
                            } catch (Exception e) {
                                out.println("Error: " + e.getMessage());
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
