<%-- 
    Document   : conexión
    Created on : 14/04/2026, 10:53:33 AM
    Author     : Nayeli
--%>

<%@ page import="java.sql.*" %>
<%
    // Declaramos la variable para que sea visible en todo el archivo
    Connection con = null; 
    
    try {
        // Driver actualizado para MySQL 8.0+
        Class.forName("com.mysql.jdbc.Driver"); 
        
        // URL con parámetros de compatibilidad
        String url = "jdbc:mysql://localhost:3307/examen_apti?useSSL=false&serverTimezone=UTC";
        
        con = DriverManager.getConnection(url, "root", "");
        
        if(con != null) {
            System.out.println("¡CONEXIÓN EXITOSA A MYSQL!"); 
        }
    } catch (Exception e) {
        out.print("Error en conexión: " + e.getMessage());
        e.printStackTrace(); // Esto enviará el error detallado a la consola de NetBeans
    }
%>
