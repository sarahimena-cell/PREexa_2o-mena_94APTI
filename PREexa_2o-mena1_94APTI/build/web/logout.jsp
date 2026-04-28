<%-- 
    Document   : logout
    Created on : 26/04/2026, 05:27:21 PM
    Author     : Nayeli
--%>

<%-- logout.jsp --%>
<%
    // 1. Eliminar todos los datos de la sesión actual
    session.removeAttribute("session_usuario");
    session.removeAttribute("session_rol");
    session.invalidate(); 

    // 2. Redirigir a tu nueva pantalla azul de acceso
    response.sendRedirect("acceso.jsp");
%>
