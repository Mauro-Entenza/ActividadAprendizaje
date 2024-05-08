package com.PoolShop.dao;
import com.PoolShop.User;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<User> {
    @Override
    public User map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new User
                (rs.getInt("ClienteID"),
                rs.getString("Nombre"),
                rs.getString("Email"),
                rs.getString("Contraseña"));
    }
}
