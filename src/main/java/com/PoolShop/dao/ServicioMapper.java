package com.PoolShop.dao;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.PoolShop.Servicio;

public class ServicioMapper implements RowMapper<Servicio> {
    @Override
    public Servicio map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Servicio(rs.getInt("ServicioID"),
                rs.getString("Nombre"),
                rs.getString("Descripcion"),
                rs.getInt("Precio"));
    }
}
