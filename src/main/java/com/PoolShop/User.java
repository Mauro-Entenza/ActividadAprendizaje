package com.PoolShop;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
    private int ClienteID;
    private String Nombre;
    private String Email;
    private String Contraseña;
}
