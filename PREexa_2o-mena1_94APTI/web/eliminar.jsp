<%-- 
    Document   : eliminar
    Created on : 9/04/2026, 11:50:44 AM
    Author     : Nayeli
--%>
<%-- 1. BLOQUE DE SEGURIDAD PARA ADMINS --%>
<%
    if(session.getAttribute("session_usuario") == null || 
       !"admin".equals(session.getAttribute("session_rol"))) {
        
        response.sendRedirect("index.jsp?error=acceso_denegado");
        return;
    }
%>

<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>
<%
    String id = request.getParameter("id");
    try {
        PreparedStatement ps = con.prepareStatement("DELETE FROM recursos_seguridad WHERE id_recurso = ?");
        ps.setString(1, id);
        ps.executeUpdate();
        response.sendRedirect("index.jsp");
    } catch (Exception e) {
        out.print("Error al eliminar: " + e.getMessage());
    }
%>