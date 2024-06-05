package com.PoolShop.Servlet;



import com.PoolShop.dao.BaseDatos;
import com.PoolShop.dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/actualizarUser")
public class ActualizarUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String clienteID = request.getParameter("ClienteID");
        String Nombre = request.getParameter("Nombre");
        String Email = request.getParameter("Email");





        try {
            BaseDatos.connect();
            BaseDatos.jdbi.withExtension(UserDao.class, dao -> dao.updateUser(clienteID, Nombre, Email));
            response.sendRedirect("index.jsp");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
