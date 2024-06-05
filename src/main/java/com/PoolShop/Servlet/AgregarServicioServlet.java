package com.PoolShop.Servlet;
import com.PoolShop.dao.BaseDatos;
import com.PoolShop.dao.ProductDao;
import com.PoolShop.dao.ServicioDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/agregarServicio")
public class AgregarServicioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String Nombre = request.getParameter("Nombre");
        String Descripcion = request.getParameter("Descripcion");
        String Precio = request.getParameter("Precio");



        try {
            BaseDatos.connect();
            BaseDatos.jdbi.withExtension(ServicioDao.class, dao -> dao.addServicio(Nombre, Descripcion, Precio));
            response.getWriter().print("ok");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } }

}