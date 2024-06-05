<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.PoolShop.Servicio" %>
<%@ page import="com.PoolShop.dao.ServicioDao" %>
<%@ page import="com.PoolShop.dao.BaseDatos" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Servicioo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<body>

    <div class="container">
        <h1>Actualizar Servicio</h1>
         <%
                                int servicioID = Integer.parseInt(request.getParameter("servicioID"));
                                BaseDatos.connect();
                                Servicio servicio = BaseDatos.jdbi.withExtension(ServicioDao.class, dao -> dao.getServicio(servicioID));
                            %>
        <form action="actualizarServicio?ServicioID=<%= servicio.getServicioID() %>"" method="post">
 <div class="form-group">
            </div>
            <div class="form-group">
                <label for="Nombre">Nombre del Servicioo:</label>
                <input type="text" class="form-control" id="Nombre" name="Nombre"value="<%= servicio.getNombre() %>" required>
            </div>
            <div class="form-group">
                <label for="Descripcion">Descripción:</label>
                <textarea class="form-control" id="Descripcion" name="Descripcion" value="<%= servicio.getDescripcion() %>" required></textarea>
            </div>
            <div class="form-group">
                <label for="Precio">Precio:</label>
                <input type="number" class="form-control" id="Precio" name="Precio" value="<%= servicio.getPrecio() %>" required>
            </div>

            </div>

           <button type="submit" class="btn btn-primary">Actualizar Servicio</button>
        </form>
    </div>
</body>
</html>

