package pe.edu.vallegrande.Controller;

import pe.edu.vallegrande.dto.Product;
import pe.edu.vallegrande.db.ConexionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductController {

    /* Listar todos los productos */
    public List<Product> listarTodos() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM products";

        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("product_name"),
                        rs.getString("description"),
                        rs.getInt("amount"),
                        rs.getDouble("price"),
                        rs.getString("product_code")
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            System.err.println("Error al listar los productos: " + e.getMessage());
        }
        return productList;
    }

    /* Agregar un nuevo producto */
    public void agregarProducto(Product product) {
        String query = "INSERT INTO products (product_name, description, amount, price, product_code) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, product.getProductName());
            pstmt.setString(2, product.getDescription());
            pstmt.setInt(3, product.getAmount());
            pstmt.setDouble(4, product.getPrice());
            pstmt.setString(5, product.getProduct_code());

            pstmt.executeUpdate();
            System.out.println("Producto creado exitosamente.");
        } catch (SQLException e) {
            System.err.println("Error al crear el producto: " + e.getMessage());
        }
    }

    /* Editar un producto existente */
    public void editarProducto(Product product) {
        String query = "UPDATE products SET product_name = ?, description = ?, amount = ?, price = ?, product_code = ? WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, product.getProductName());
            pstmt.setString(2, product.getDescription());
            pstmt.setInt(3, product.getAmount());
            pstmt.setDouble(4, product.getPrice());
            pstmt.setString(5, product.getProduct_code());
            pstmt.setInt(6, product.getId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Producto actualizado exitosamente.");
            } else {
                System.out.println("No se encontró un producto con el ID especificado.");
            }
        } catch (SQLException e) {
            System.err.println("Error al actualizar el producto: " + e.getMessage());
        }
    }

    /* Buscar un producto por ID */
    public Product buscarProductoPorId(int id) {
        Product product = null;
        String query = "SELECT * FROM products WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new Product(
                        rs.getInt("id"),
                        rs.getString("product_name"),
                        rs.getString("description"),
                        rs.getInt("amount"),
                        rs.getDouble("price"),
                        rs.getString("product_code")
                );
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar el producto: " + e.getMessage());
        }
        return product;
    }

    /* Eliminar un producto */
    public void eliminarProducto(int id) {
        String query = "DELETE FROM products WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Producto eliminado exitosamente.");
            } else {
                System.out.println("No se encontró un producto con el ID especificado.");
            }
        } catch (SQLException e) {
            System.err.println("Error al eliminar el producto: " + e.getMessage());
        }
    }
}
