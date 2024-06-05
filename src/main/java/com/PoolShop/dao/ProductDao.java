package com.PoolShop.dao;
import com.PoolShop.Product;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import java.util.List;

public interface ProductDao {
    @SqlQuery("SELECT * FROM Productos")
    @UseRowMapper(ProductMapper.class)
    List<Product> getAllProducts();


    @SqlQuery("SELECT * FROM Productos WHERE ProductoID = :ProductoID")
    @RegisterRowMapper(ProductMapper.class)
    Product getProduct(@Bind("ProductoID") int ProductoID);

    void insertProduct(Product product);

    @SqlUpdate("INSERT INTO Productos (Nombre, Descripcion, Precio, CategoriaID) VALUES (?, ?, ?, ?)")
    int addProduct(String Nombre, String Descripcion, String Precio, int CategoriaID);

    @SqlUpdate("DELETE FROM Productos WHERE ProductoID = :productoID")
    int deleteProduct(@Bind("productoID") int productoID);

    @SqlUpdate("UPDATE Productos SET Nombre = :nombre, Descripcion = :descripcion, Precio = :precio, CategoriaID = :categoriaID WHERE ProductoID = :productoID")
    int updateProduct(@Bind("productoID") String productoID, @Bind("nombre") String nombre, @Bind("descripcion") String descripcion, @Bind("precio") String precio, @Bind("categoriaID") int categoriaID);

}
