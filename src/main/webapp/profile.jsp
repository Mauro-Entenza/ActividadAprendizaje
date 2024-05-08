<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.PoolShop.Product" %>
<%@ page import="com.PoolShop.dao.ProductDao" %>
<%@ page import="com.PoolShop.dao.UserDao" %>
<%@ page import="org.jdbi.v3.core.Jdbi" %>
<%@ page import="com.PoolShop.dao.BaseDatos" %>
<%@ page import="com.PoolShop.dao.UserMapper" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>PoolShop - Mi Perfil</title>
</head>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <div class="col-md-3 mb-2 mb-md-0">
        <a href="/coches" class="btn btn-outline-primary me-2">Volver a la lista de Productos</a>
    </div>

    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li class="p-3 mb-2 bg-danger text-white"><h1>POOLSHOP</h1></li>
    </ul>

    <div class="col-md-3 text-end">
        <% if (session.getAttribute("logged")!= null && (boolean) session.getAttribute("logged")) { %>
            <a href="profile.jsp" class="btn btn-outline-primary me-2" style="font-weight: bold; color: red; margin-left: 0;">Perfil</a>
            <p class="text-end">¡Hola, <span class="text-primary fw-bold"><%= session.getAttribute("Nombre") %></span>!</p>
            <button type="button" class="btn btn-outline-primary me-2">
                <a href="logout.jsp" class="text-decoration-none">Cerrar sesión</a>
            </button>
        <% } else { %>
            <button type="button" class="btn btn-outline-primary me-2">
                <a href="login.jsp" class="text-decoration-none">Iniciar Sesión</a>
            </button>
            <button type="button" class="btn btn-primary">
                <a href="register.jsp" class="text-decoration-none text-white">Registrarse</a>
            </button>
        <% } %>
    </div>

</header>
<body>

<script type="text/javascript">
$(document).ready(function() {
    $("form").on("submit", function(event) {
        event.preventDefault();
        const formValue = $(this).serialize();
        $.ajax("actualizarperfil", {
            type: "POST",
            data: formValue,
            statusCode: {
                200: function(response) {
                    if (response === "ok") {
                        window.location.href = "/coches";
                    } else {
                        $("#result").html(response);
                    }
                }
            }
        });
    });
});
</script>
<div class="container mt-4">
    <h1 class="mb-4">Mi Perfil</h1>

    <div class="row">
        <div class="col-md-6">
            <form action="actualizarperfil" method="post">
                <div class="mb-3">
                    <label for="Nombre" class="form-label">Nombre Actual: <%= session.getAttribute("Nombre") %></label>
                    <input type="text" class="form-control" id="nombre" name="nuevoNombre" placeholder="Nuevo Nombre">
                </div>
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            </form>
        </div>
    </div>
</div>

<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <div class="col-md-4 d-flex align-items-center">
        <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
            <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
        </a>
        <span class="mb-3 mb-md-0 text-body-secondary">© 2024 POOLSHOP, Copyright</span>
    </div>

    <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
        <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"></use></svg></a></li>
        <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"></use></svg></a></li>
        <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"></use></svg></a></li>
    </ul>
</footer>

</body>
</html>
