<%-- 
    Document   : registro_usuarios
    Created on : 26/04/2026, 03:07:00 PM
    Author     : Nayeli
--%>

<div class="card shadow p-4">
    <h4>Registrar Nuevo Usuario</h4>
    <form action="guardar_usuario.jsp" method="POST">
        <div class="mb-3">
            <label>Nombre de Usuario:</label>
            <input type="text" name="new_user" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Contraseña:</label>
            <input type="password" name="new_pass" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Rol del Sistema:</label>
            <select name="new_rol" class="form-select">
                <option value="usuario">Usuario (Solo Lectura)</option>
                <option value="admin">Administrador (Control Total)</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Crear Cuenta</button>
    </form>
</div>
