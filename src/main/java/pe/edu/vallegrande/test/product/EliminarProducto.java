package pe.edu.vallegrande.test.product;

import pe.edu.vallegrande.Controller.ProductController;

public class EliminarProducto {

    public static void main(String[] args) {
        ProductController productController = new ProductController();

        int idProducto = 2; // ID del producto a eliminar
        productController.eliminarProducto(idProducto);
    }
}
