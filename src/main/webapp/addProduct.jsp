<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PoolShop - Bienvenido</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .form-label {
            font-weight: bold;
        }

        .footer ul li {
            margin-right: 10px;
        }
    </style>

</head>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            const formValue = $(this).serialize();
            $.ajax("agregarProducto", {
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

<body>

<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <div class="col-md-3 mb-2 mb-md-0">
        <a href="/coches" class="btn btn-outline-primary me-2">Volver a la lista de Productos</a>
    </div>

    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li class="p-3 mb-2 bg-danger text-white"><h1>POOLSHOP</h1></li>
    </ul>

    <div class="col-md-3 text-end">
        <% if (session.getAttribute("logged")!= null && (boolean) session.getAttribute("logged")) { %>
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

<main class="form-signin w-50 m-auto p-5">
    <form class="p-5">
        <h2 class="mb-4">Agregar Producto</h2>
        <div class="mb-3">
            <label for="NombreProducto" class="form-label">Nombre del producto</label>
            <textarea class="form-control" id="NombreProducto" name="NombreProducto" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="Descripcion" class="form-label">Descripcion</label>
            <textarea class="form-control" id="Descripcion" name="Descripcion" rows="3" required></textarea>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="Precio" class="form-label">Precio</label>
                <input type="number" class="form-control" id="Precio" name="Precio" required>
            </div>
            <div class="col-md-6">
                <label for="CategoriaID" class="form-label">Categoria</label>
                <select class="form-select" id="CategoriaID" name="CategoriaID" required>
                    <option value="1">Categoria 1</option>
                    <option value="2">Categoria 2</option>
                    <option value="3">Categoria 3</option>
                </select>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Agregar Producto</button>
    </form>
</div>
</main>

<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <div class="col-md-4 d-flex align-items-center">
        <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
            <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"></use></svg></a>
        <span class="mb-3 mb-md-0 text-body-secondary">© 2024 POOLSHOP, Copyright</span>
    </div>

    <ul class="nav col-md-4 justify-content-end list-unstyled d-flex footer">
        <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"></use></svg></a></li>
        <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"></use></svg></a></li>
        <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"></use></svg></a></li>
    </ul>
</footer>

</body>
</html>
