<%-- 
    Document   : admin_attack
    Created on : 12/04/2026, 12:42:09 PM
    Author     : Nayeli
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="conexion.jsp" %> <%-- Usamos tu conexión existente --%>
<html>
<head>
    <meta charset="UTF-8">
    <title>AdminSafe | Log de Intrusiones</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Registros de Intrusión Detectados</h2>
        <a href="index.jsp" class="btn btn-outline-primary">Volver al Panel</a>
    </div>
    
    <div class="alert alert-info text-center">
        <strong>Reporte General del Sistema:</strong> <%= new java.util.Date() %>
    </div>

    <table class="table table-striped table-hover border shadow-sm">
        <thead class="table-danger">
            <tr>
                <th>ID</th>
                <th>Dirección IP</th>
                <th>Carga Maliciosa (Payload)</th>
                <th>Tipo de Ataque</th>
                <th>Fecha y Hora</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Statement st = con.createStatement();
                    // Ordenamos por la fecha más reciente (usando la columna 'fecha' de la tabla t_sucesos)
                    ResultSet rs = st.executeQuery("SELECT * FROM t_sucesos ORDER BY fecha DESC");

                    while(rs.next()) {
            %>
            <tr>
                <td><strong>#<%= rs.getInt("id") %></strong></td>
                <td><code><%= rs.getString("ip_address") %></code></td>
                <td class="text-danger"><code><%= rs.getString("payload") %></code></td>
                <td><span class="badge bg-warning text-dark"><%= rs.getString("attack_type") %></span></td>
                <td><small><%= rs.getTimestamp("fecha") %></small></td>
            </tr>
            <% 
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5' class='alert alert-danger'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>
</body>
</html>
