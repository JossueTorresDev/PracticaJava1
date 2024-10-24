package pe.edu.vallegrande.test.product;

import pe.edu.vallegrande.Controller.ProductController;
import pe.edu.vallegrande.dto.Product;

public class AgregarProducto {

    public static void main(String[] args) {
        ProductController productController = new ProductController();

        // Crear un nuevo producto
        Product nuevoProducto = new Product();
        nuevoProducto.setProductName(" Aleee Vennus");
        nuevoProducto.setDescription("Monitor de 24 pulgadas, resolución Full HD");
        nuevoProducto.setAmount(120);
        nuevoProducto.setPrice(200.00);
        nuevoProducto.setProduct_code("Hola");

        productController.agregarProducto(nuevoProducto);
    }
}
