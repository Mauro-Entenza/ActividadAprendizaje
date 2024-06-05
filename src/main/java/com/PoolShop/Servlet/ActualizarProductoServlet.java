package com.PoolShop.Servlet;
import com.PoolShop.dao.BaseDatos;
import com.PoolShop.dao.ProductDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/actualizarProducto")
public class ActualizarProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String Nombre = request.getParameter("Nombre");
        String Descripcion = request.getParameter("Descripcion");
        String Precio = request.getParameter("Precio");
        int CategoriaID = Integer.parseInt(request.getParameter("CategoriaID"));
        String productoID = request.getParameter("ProductoID");



        try {
            BaseDatos.connect();
            BaseDatos.jdbi.withExtension(ProductDao.class, dao -> dao.updateProduct(productoID, Nombre, Descripcion, Precio, CategoriaID));
            response.sendRedirect("index.jsp");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
