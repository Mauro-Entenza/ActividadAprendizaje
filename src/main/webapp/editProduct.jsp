<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.PoolShop.Product" %>
<%@ page import="com.PoolShop.dao.ProductDao" %>
<%@ page import="com.PoolShop.dao.BaseDatos" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Producto</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<body>

    <div class="container">
        <h1>Actualizar Producto</h1>
         <%
                                int productoID = Integer.parseInt(request.getParameter("ProductoID"));
                                BaseDatos.connect();
                                Product product = BaseDatos.jdbi.withExtension(ProductDao.class, dao -> dao.getProduct(productoID));
                            %>
        <form action="actualizarProducto?ProductoID=<%= product.getProductoID() %>"" method="post">
 <div class="form-group">


            </div>
            <div class="form-group">
                <label for="Nombre">Nombre del Producto:</label>
                <input type="text" class="form-control" id="Nombre" name="Nombre"value="<%= product.getNombre() %>" required>
            </div>
            <div class="form-group">
                <label for="Descripcion">Descripción:</label>
                <textarea class="form-control" id="Descripcion" name="Descripcion" value="<%= product.getDescripcion() %>" required></textarea>
            </div>
            <div class="form-group">
                <label for="Precio">Precio:</label>
                <input type="number" class="form-control" id="Precio" name="Precio" value="<%= product.getPrecio() %>" required>
            </div>
            <div class="form-group">
                <label for="CategoriaID">Categoría:</label>
                <select class="form-control" id="CategoriaID" name="CategoriaID" value="<%= product.getCategoriaID() %>"required>

                    <option value="1">Categoría 1</option>
                    <option value="2">Categoría 2</option>
                    <option value="3">Categoría 3</option>

                </select>
            </div>

           <button type="submit" class="btn btn-primary">Actualizar Producto</button>
        </form>
    </div>
</body>
</html>

