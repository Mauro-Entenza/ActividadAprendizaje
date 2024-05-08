package com.PoolShop;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Product {
        private int ProductoID;
        private String Nombre;
        private String Descripcion;
        private int Precio;
        private int CategoriaID;
        private String Imagen;
    }
