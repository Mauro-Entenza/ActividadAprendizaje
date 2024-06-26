package com.PoolShop.dao;
import com.PoolShop.Product;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import java.sql.ResultSet;
import java.sql.SQLException;
public class ProductMapper implements RowMapper<Product> {
    @Override
    public Product map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Product(rs.getInt("ProductoID"),
                rs.getString("Nombre"),
                rs.getString("Descripcion"),
                rs.getInt("Precio"),
                rs.getInt("CategoriaID"),
                rs.getString("Imagen"));
    }
}

