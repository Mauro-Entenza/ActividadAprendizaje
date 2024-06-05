<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.PoolShop.User" %>
<%@ page import="com.PoolShop.dao.UserDao" %>
<%@ page import="com.PoolShop.dao.BaseDatos" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle del Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Detalles del Usuario</h1>
        <%
            String nombre = request.getParameter("Nombre");
            BaseDatos.connect();
            User user = BaseDatos.jdbi.withExtension(UserDao.class, dao -> dao.getUser(nombre));
        %>
        <div class="card">
            <div class="card-header">
                Información del Usuario
            </div>
            <div class="card-body">
                <h5 class="card-title">Nombre: <span class="text-primary"><%= user.getNombre() %></span></h5>
                <p class="card-text">Contraseña: <span class="text-muted"><%= user.getContraseña() %></span></p>
                <p class="card-text">Email: <span class="text-muted"><%= user.getEmail() %></span></p>
                <form action="eliminarUsuario" method="post" class="d-inline">
                    <input type="hidden" name="nombre" value="<%= user.getNombre() %>">
                    <button type="submit" class="btn btn-danger" onclick="return confirm('¿Está seguro de que desea eliminar este usuario?');">Eliminar</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+gkbx5K50CqvYv/UfpetRP2KxQ+t" crossorigin="anonymous"></script>
</body>
</html>
