<%-- 
    Document   : nuevo_tip
    Created on : 9/04/2026, 11:54:22 AM
    Author     : Nayeli
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nuevo Tip</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h3>Registrar Consejo de Seguridad</h3>
    <form action="guardar.jsp" method="POST" class="col-md-6">
        <div class="mb-3">
            <label>Título:</label>
            <input type="text" name="titulo" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Contenido:</label>
            <textarea name="contenido" class="form-control" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label>Categoría:</label>
            <select name="categoria" class="form-select">
                <option value="Tip técnico">Tip Técnico</option>
                <option value="Consejo">Consejo</option>
                <option value="Legislación">Legislación</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Guardar Tip</button>
        <a href="index.jsp" class="btn btn-secondary">Volver</a>
    </form>
</body>
</html>
