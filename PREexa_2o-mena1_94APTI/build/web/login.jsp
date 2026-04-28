<%-- 
    Document   : login
    Created on : 26/04/2026, 02:16:09 PM
    Author     : Nayeli
--%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CiberLex | Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light d-flex align-items-center vh-100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card shadow border-0">
                    <div class="card-body p-5">
                        <h3 class="text-center mb-4">CiberLex Login</h3>
                        <form action="validar_login.jsp" method="POST">
                            <div class="mb-3">
                                <label class="form-label">Usuario</label>
                                <input type="text" name="txtUser" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Contraseña</label>
                                <input type="password" name="txtPass" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Entrar al Panel</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
