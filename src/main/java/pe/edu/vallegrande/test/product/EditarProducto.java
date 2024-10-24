package pe.edu.vallegrande.test.product;

import pe.edu.vallegrande.Controller.ProductController;
import pe.edu.vallegrande.dto.Product;

public class EditarProducto {

    public static void main(String[] args) {
        ProductController productController = new ProductController();

        // Datos del producto a actualizar
        Product productoEditado = new Product();
        productoEditado.setId(1); // ID del producto que deseas editar
        productoEditado.setProductName("Lapicerp");
        productoEditado.setDescription("Color azul y rojo");
        productoEditado.setAmount(200);
        productoEditado.setPrice(350.99);
        productoEditado.setProduct_code("Hola");

        productController.editarProducto(productoEditado);
    }
}
