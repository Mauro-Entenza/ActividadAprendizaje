package com.PoolShop.dao;
import com.PoolShop.Product;
import com.PoolShop.User;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import java.util.List;


public interface UserDao {
    @SqlQuery("SELECT * FROM Clientes")
    @UseRowMapper(UserMapper.class)
    List<User> getAllUsers();


    @SqlQuery("SELECT * FROM Clientes WHERE ClienteID = ?")
    @UseRowMapper(UserMapper.class)
    User getUserbyClienteID(String ClienteID);
    @SqlQuery("SELECT * FROM Clientes WHERE Nombre = ?")
    @UseRowMapper(UserMapper.class)
    User getUser(String Nombre);

    @SqlQuery("SELECT * FROM Clientes WHERE Nombre = ? AND Contraseña = ?")
    @UseRowMapper(UserMapper.class)
    User getUser(String Nombre, String Contraseña);

    @SqlUpdate("INSERT INTO Clientes (Nombre, Email, Contraseña) VALUES (?, ?, ?)")
    int addUser(String Nombre, String Email, String Contraseña);

    @SqlUpdate("UPDATE Clientes SET Nombre = ? WHERE ClienteID = ?")
    int updateUser(String Nombre, int ClienteID);
}

