package com.PoolShop.Servlet;
import com.PoolShop.dao.ProductDao;
import com.PoolShop.dao.BaseDatos;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/eliminarProducto")
public class EliminarProductoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productoID = Integer.parseInt(request.getParameter("productoID"));

            BaseDatos.connect();
            BaseDatos.jdbi.useExtension(ProductDao.class, dao -> {
                dao.deleteProduct(productoID);
            });

            response.sendRedirect("index.jsp");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
