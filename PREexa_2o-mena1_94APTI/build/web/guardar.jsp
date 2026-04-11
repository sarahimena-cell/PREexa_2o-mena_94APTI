<%-- 
    Document   : guardar
    Created on : 9/04/2026, 11:55:52 AM
    Author     : Nayeli
--%>

<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>
<%
    String titulo = request.getParameter("titulo");
    String contenido = request.getParameter("contenido");
    String categoria = request.getParameter("categoria");

    try {
        String sql = "INSERT INTO recursos_seguridad (titulo, contenido, categoria) VALUES (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, titulo);
        ps.setString(2, contenido);
        ps.setString(3, categoria);
        
        int filas = ps.executeUpdate();
        if(filas > 0) {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        out.print("Error al guardar: " + e.getMessage());
    }
%>
