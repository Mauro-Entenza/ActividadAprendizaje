package com.PoolShop.Servlet;
import com.PoolShop.dao.BaseDatos;
import com.PoolShop.dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/eliminarUsuario")
public class EliminarUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String nombre = request.getParameter("nombre");

            BaseDatos.connect();
            BaseDatos.jdbi.useExtension(UserDao.class, dao -> {
                dao.deleteUser(nombre);
            });

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
