package com.PoolShop.Servlet;
import com.PoolShop.User;
import com.PoolShop.dao.UserDao;
import com.PoolShop.dao.BaseDatos;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/buscarUsuario")
public class BuscarUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");

        try {
            BaseDatos.connect();
            List<User> users = BaseDatos.jdbi.withExtension(UserDao.class, dao -> dao.getUserByNombre("%" + nombre + "%"));
            request.setAttribute("users", users);
            request.getRequestDispatcher("listarUsuarios.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error al buscar usuarios: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
            BaseDatos.disconnect();
        }
    }
}
