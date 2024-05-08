package com.PoolShop.Servlet;
import com.PoolShop.User;
import com.PoolShop.dao.BaseDatos;
import com.PoolShop.dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;




@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String Nombre = request.getParameter("Nombre");
        String Email = request.getParameter("Email");
        String Contraseña = request.getParameter("Contraseña");

        try {
            BaseDatos.connect();
            BaseDatos.jdbi.withExtension(UserDao.class, dao -> dao.addUser(Nombre, Email, Contraseña));
            User user = BaseDatos.jdbi.withExtension(UserDao.class, dao -> dao.getUser(Nombre));
            HttpSession session = request.getSession();
            session.setAttribute("ClienteID", user.getClienteID());
            session.setAttribute("Nombre", user.getNombre());
            session.setAttribute("Email", user.getEmail());
            session.setAttribute("Contraseña", user.getContraseña());
            response.getWriter().print("ok");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}