package com.PoolShop.Servlet;

import com.PoolShop.dao.ProductDao;
import com.PoolShop.dao.BaseDatos;
import com.PoolShop.dao.ServicioDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/eliminarServicio")
public class EliminarServicioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int servicioID = Integer.parseInt(request.getParameter("servicioID"));

            BaseDatos.connect();
            BaseDatos.jdbi.useExtension(ServicioDao.class, dao -> {
                dao.deleteServicio(servicioID);
            });

            response.sendRedirect("index.jsp");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
