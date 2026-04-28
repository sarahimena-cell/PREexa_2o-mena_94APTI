<%-- 
    Document   : index
    Created on : 14/04/2026, 10:47:44 AM
    Author     : Nayeli
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="filtro_waf.jsp" %>
<%@ include file="conexion.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>CiberLex | Panel de Administración</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .text-truncate-custom {
            max-width: 300px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Gestión de Ciberseguridad Empresarial</h2>
        <div>
            <%-- Botón para ver ataques registrados --%>
            <a href="admin_attack.jsp" class="btn btn-outline-danger me-2">🛡️ Ver Log WAF</a>
            <a href="nuevo_tip.jsp" class="btn btn-success">+ Agregar Recurso</a>
        </div>
    </div>
    
    <%-- El resto de tu tabla de recursos se mantiene igual --%>
    <table class="table table-hover table-bordered shadow-sm">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Categoría</th>
                <th>Contenido</th>
                <th>Última Modificación</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM recursos_seguridad ORDER BY id_recurso DESC");
                    
                    while(rs.next()) {
            %>
            <tr>
                <td><strong>#<%= rs.getInt("id_recurso") %></strong></td>
                <td><%= rs.getString("titulo") %></td>
                <td><span class="badge bg-primary"><%= rs.getString("categoria") %></span></td>
                <td class="text-truncate-custom"><%= rs.getString("contenido") %></td>
                <td><small class="text-muted"><%= rs.getTimestamp("ultima_modificacion") %></small></td>
                <td>
                    <div class="btn-group" role="group">
                        <a href="editar.jsp?id=<%= rs.getInt("id_recurso") %>" class="btn btn-sm btn-warning">Editar</a>
                        <a href="eliminar.jsp?id=<%= rs.getInt("id_recurso") %>" 
                           class="btn btn-sm btn-danger" 
                           onclick="return confirm('¿Está seguro de eliminar este registro?')">Borrar</a>
                    </div>
                </td>
            </tr>
            <% 
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error al cargar datos: " + e.getMessage() + "</div>");
                }
            %>
        </tbody>
    </table>
</body>
</html>
