package pe.edu.vallegrande.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private int id;
    private String productName;
    private String description;
    private int amount;
    private double price;
    private String product_code;
}
