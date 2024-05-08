package com.PoolShop.Servlet;
import com.PoolShop.dao.BaseDatos;
import com.PoolShop.dao.ProductDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/borrarproducto")
public class BorrarProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
       int  productoID = Integer.parseInt(request.getParameter("productoID"));



        try {
            BaseDatos.connect();
            BaseDatos.jdbi.withExtension(ProductDao.class, dao -> dao.deleteProduct(productoID));
            response.getWriter().print("ok");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } }

}
