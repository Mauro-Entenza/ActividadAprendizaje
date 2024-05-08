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

@WebServlet("/actualizarperfil")
public class ActualizarPerfilServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String nuevoNombre = request.getParameter("nuevoNombre");


        try {
            BaseDatos.connect();
            HttpSession session = request.getSession();
            BaseDatos.jdbi.withExtension(UserDao.class, dao -> dao.updateUser(nuevoNombre, (Integer) session.getAttribute("ClienteID")));
            User user = BaseDatos.jdbi.withExtension(UserDao.class, dao -> dao.getUserbyClienteID( String.valueOf(session.getAttribute("ClienteID"))));
            session.setAttribute("ClienteID", user.getClienteID());
            session.setAttribute("Nombre", user.getNombre());
            session.setAttribute("Email", user.getEmail());
            session.setAttribute("Contraseña", user.getContraseña());
            response.getWriter().print("ok");
            response.sendRedirect("profile.jsp");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}

