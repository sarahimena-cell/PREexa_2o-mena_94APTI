<%-- 
    Document   : validar_login
    Created on : 26/04/2026, 02:17:29 PM
    Author     : Nayeli
--%>

<%@page import="java.sql.*"%>
<%@page import="java.security.MessageDigest"%>
<%@include file="conexion.jsp" %>
<%
    String user = request.getParameter("txtUser");
    String pass = request.getParameter("txtPass");
    
    // Convertir pass a MD5
    MessageDigest md = MessageDigest.getInstance("MD5");
    md.update(pass.getBytes());
    byte[] digest = md.digest();
    StringBuilder sb = new StringBuilder();
    for (byte b : digest) { sb.append(String.format("%02x", b)); }
    String passHash = sb.toString();

    try {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM usuarios WHERE nombre_usuario=? AND password_hash=?");
        ps.setString(1, user);
        ps.setString(2, passHash);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            session.setAttribute("session_usuario", rs.getString("nombre_usuario"));
            session.setAttribute("session_rol", rs.getString("rol")); // Guardamos el rol
            response.sendRedirect("index.jsp");
}
        else {
            out.print("<script>alert('Datos incorrectos'); window.location='login.jsp';</script>");
        }
    } catch(Exception e) { out.print(e); }
%>
