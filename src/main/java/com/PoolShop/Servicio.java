package com.PoolShop;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Servicio {
    private int ServicioID;
    private String Nombre;
    private String Descripcion;
    private int Precio;
}
