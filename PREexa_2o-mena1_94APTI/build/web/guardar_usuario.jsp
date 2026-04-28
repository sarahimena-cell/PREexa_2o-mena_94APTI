<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ include file="conexion.jsp" %>

<%
    // Recibimos los datos del formulario de acceso.jsp
    String user = request.getParameter("new_user");
    String pass = request.getParameter("new_pass");
    String rol  = request.getParameter("new_rol");

    if (user != null && pass != null) {
        try {
            // Aplicamos Criptografía MD5 (Compromiso 1 del GROW)
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(pass.getBytes());
            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) { sb.append(String.format("%02x", b)); }
            String passCifrada = sb.toString();

            // Insertamos en la tabla 'usuarios'
            // IMPORTANTE: Verifica que tus columnas se llamen exactamente así en PHPMyAdmin
            String sql = "INSERT INTO usuarios (nombre_usuario, password_hash, rol) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, passCifrada);
            ps.setString(3, rol);

            int filas = ps.executeUpdate();

            if (filas > 0) {
                // Si todo sale bien, lo mandamos al login para que entre
                out.print("<script>alert('¡Cuenta creada! Ahora puedes iniciar sesión.'); window.location='acceso.jsp';</script>");
            }
        } catch (Exception e) {
            out.print("Error en BD: " + e.getMessage());
        }
    } else {
        out.print("Error: Datos incompletos.");
    }
%>