<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.PoolShop.Servicio" %>
<%@ page import="com.PoolShop.dao.ServicioDao" %>
<%@ page import="com.PoolShop.dao.BaseDatos" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Detalle del Servicio</title>
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
                    Detalle del Servicio
                </div>
                <div class="card-body">

                    <%
                        int servicioID = Integer.parseInt(request.getParameter("ServicioID"));
                        BaseDatos.connect();
                        Servicio servicio = BaseDatos.jdbi.withExtension(ServicioDao.class, dao -> dao.getServicio(servicioID));
                    %>
                    <h5 class="card-title"><%= servicio.getNombre() %></h5>
                    <p class="card-text"><%= servicio.getDescripcion() %></p>
                    <p class="card-text">Precio: <%= servicio.getPrecio() %>€</p>
                </div>
                    <% if (session.getAttribute("logged")!= null && (boolean) session.getAttribute("logged")) { %>
                    <form action="editServicio.jsp" method="get" class="d-inline">
                        <input type="hidden" name="servicioID" value="<%= servicioID %>">
                        <a href="editServicio.jsp?servicioID=<%= servicio.getServicioID() %>" type="button" class="btn btn-sm btn-outline-primary">Editar</a>
                    </form>
                    <form action="eliminarServicio" method="post" class="d-inline">
                        <input type="hidden" name="servicioID" value="<%= servicioID %>">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('¿Está seguro de que desea eliminar este servicio?');">Eliminar</button>
                    </form>
                     <% } else { %>
                     <% } %>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
