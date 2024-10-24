package pe.edu.vallegrande.test.product;

import pe.edu.vallegrande.Controller.ProductController;
import pe.edu.vallegrande.dto.Product;

import java.util.List;

public class ListarTodosLosProductos {

    public static void main(String[] args) {
        ProductController productController = new ProductController();
        List<Product> productos = productController.listarTodos();

        System.out.println("Lista de Productos:");
        for (Product producto : productos) {
            System.out.println("ID: " + producto.getId());
            System.out.println("Nombre del Producto: " + producto.getProductName());
            System.out.println("Descripción: " + producto.getDescription());
            System.out.println("Cantidad: " + producto.getAmount());
            System.out.println("Precio: " + producto.getPrice());
            System.out.println("Producto Codigo: " + producto.getProduct_code());

        }
    }
}
