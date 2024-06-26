package com.PoolShop.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import java.sql.SQLException;

import static com.PoolShop.Constants.*;

public class BaseDatos {
    public static Jdbi jdbi;
    public static Handle db;

    public static void connect() throws ClassNotFoundException {
        Class.forName(DRIVER);
        jdbi = Jdbi.create(CONNECTION_STRING, USERNAME, PASSWORD);
        jdbi.installPlugin(new SqlObjectPlugin());
        db = jdbi.open();
    }

    public static void disconnect() {
    }

    public void close() throws SQLException{
        db.close();
    }
}


