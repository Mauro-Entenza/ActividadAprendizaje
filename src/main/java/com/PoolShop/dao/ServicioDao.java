package com.PoolShop.dao;
import com.PoolShop.Servicio;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ServicioDao {

        @SqlQuery("SELECT * FROM Servicios")
        @UseRowMapper(ServicioMapper.class)
        List<Servicio> getAllServicios();


        @SqlQuery("SELECT * FROM Servicios WHERE ServicioID = :ServicioID")
        @RegisterRowMapper(ServicioMapper.class)
        Servicio getServicio(@Bind("ServicioID") int ServicioID);

        void insertServicio(Servicio servicio);

        @SqlUpdate("INSERT INTO Servicios (Nombre, Descripcion, Precio) VALUES (?, ?, ?)")
        int addServicio(String Nombre, String Descripcion, String Precio);

        @SqlUpdate("DELETE FROM Servicios WHERE ServicioID = :servicioID")
        int deleteServicio(@Bind("servicioID") int servicioID);

        @SqlUpdate("UPDATE Servicios SET Nombre = :nombre, Descripcion = :descripcion, Precio = :precio WHERE ServicioID = :servicioID")
        int updateServicio(@Bind("servicioID") String servicioID, @Bind("nombre") String nombre, @Bind("descripcion") String descripcion, @Bind("precio") String precio);


}


