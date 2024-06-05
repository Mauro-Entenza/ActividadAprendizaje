<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.PoolShop.User" %>
<%@ page import="com.PoolShop.dao.UserDao" %>
<%@ page import="com.PoolShop.dao.BaseDatos" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<body>

    <div class="container">
        <h1>Actualizar User</h1>
        <%
                                String nombre = request.getParameter("Nombre");
                                BaseDatos.connect();
                                User user = BaseDatos.jdbi.withExtension(UserDao.class, dao -> dao.getUser(nombre));
                            %>
        <form action="actualizarUser" method="post">
 <div class="form-group">
            </div>
            <div class="form-group">
                <label for="Nombre">Nombre del User:</label>
                <input type="text" class="form-control" id="Nombre" name="Nombre"value="<%= user.getNombre() %>" required>
            </div>
            <div class="form-group">
                <label for="Email">Descripción:</label>
                <textarea class="form-control" id="Email" name="Email" value="<%= user.getEmail() %>" required></textarea>
            </div>



            </div>

           <button type="submit" class="btn btn-primary">Actualizar User</button>
        </form>
    </div>
</body>
</html>