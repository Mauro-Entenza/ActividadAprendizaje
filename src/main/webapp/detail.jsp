<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.PoolShop.Product" %>
<%@ page import="com.PoolShop.dao.ProductDao" %>
<%@ page import="com.PoolShop.dao.BaseDatos" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Detalle del Producto</title>
    <style>
     .card-header {
           width: 100%;
           height: 50%;
           background-color: #007bff;
           color: white;
           font-weight: bold;
       }

     .card-body {
           width: 100%;
           height: 100%;
       }

     .card-footer {
           width: 100%;
           height: 50%;
       }

     .card.shadow {
           width: 40%;
           height: 150%;
       }
    </style>
</head>

<body>
    <main>
        <div class="container mt-5">
            <div class="row">
                <div class="col-12">
                    <a href="index.jsp" class="btn btn-secondary float-left">Volver atrás</a>
                </div>
            </div>
            <div class="card shadow">
                <div class="card-header text-center">
                    Detalle del Producto
                </div>
                <div class="card-body">

                    <%
                        int productoID = Integer.parseInt(request.getParameter("ProductoID"));
                        // Conectar a la base de datos y obtener el producto por su ID
                        BaseDatos.connect();
                        Product product = BaseDatos.jdbi.withExtension(ProductDao.class, dao -> dao.getProduct(productoID));
                    %>

                    <img src="BillarImagenes/<%= product.getImagen() %>" class="card-img-top mb-3" alt="Imagen del Producto">
                    <h5 class="card-title"><%= product.getNombre() %></h5>
                    <p class="card-text"><%= product.getDescripcion() %></p>
                    <p class="card-text">Precio: <%= product.getPrecio() %>€</p>
                </div>
                <div class="card-footer text-muted">
                    <form action="comprar" method="post">
                        <input type="hidden" name="productoID" value="<%= productoID %>">
                        <button class="btn btn-primary">Comprar</button>


                </div>
            </div>
        </div>
    </main>
</body>
</html>