<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.PoolShop.Product" %>
<%@ page import="com.PoolShop.dao.ProductDao" %>
<%@ page import="org.jdbi.v3.core.Jdbi" %>
<%@ page import="com.PoolShop.dao.BaseDatos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <!doctype html>
 <head>
     <meta charset="utf-8"/>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>PoolShop</title>

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
           integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
             integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

 </head>

 <script type="text/javascript">
 $(document).ready(function() {
     $("form").on("submit", function(event) {
         event.preventDefault();
         const formValue = $(this).serialize();
         $.ajax("login", {
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
 <body class="d-flex align-items-center py-4 bg-body-tertiary">
     <main class="form-signin w-50 m-auto p-5">

         <form class="p-5">
             <h2 class="h3 mb-3 fw-normal">Iniciar sesión</h2>
             <div class="form-floating">
                 <input type="text" name="Nombre" class="form-control" id="floatingInput" placeholder="Nombre">
                 <label for="floatingInput">Nombre</label>
             </div>
             <div class="form-floating py-2">
                 <input type="password" name="Contraseña" class="form-control" id="floatingPassword" placeholder="Contraseña">
                 <label for="floatingPassword">Contraseña</label>
             </div>

             <button class="btn btn-primary w-100 py-2" type="submit">Iniciar sesión</button>
             <p class="h5 py-2 fw-normal"><a href="register.jsp" class="nav-link">¿No tienes cuenta? Registrate!</a></p>
         </form>
         <div id="result"></div>


     </main>
 </body>