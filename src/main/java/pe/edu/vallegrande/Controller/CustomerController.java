package pe.edu.vallegrande.Controller;

import pe.edu.vallegrande.dto.Customer;
import pe.edu.vallegrande.db.ConexionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerController {

    /* Listar todos los pedidos */
    public List<Customer> listarTodos() {
        List<Customer> customers = new ArrayList<>();
        String query = "SELECT * FROM customer"; // Asegúrate de que la consulta sea correcta

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setId(resultSet.getInt("id")); // Verifica los nombres de las columnas
                customer.setFirst_name(resultSet.getString("name")); // Cambiado a "name"
                customer.setLast_name(resultSet.getString("last_name"));
                customer.setDocument_type(resultSet.getString("document_type"));
                customer.setDocument_number(resultSet.getString("number_document")); // Cambiado a "number_document"
                customer.setMobile(resultSet.getString("phone")); // Cambiado a "phone"
                customer.setEmail(resultSet.getString("email"));
                customer.setState(resultSet.getDate("state"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customers;
    }

    /* Agregar un nuevo pedido */
    public void agregarPedido(Customer customer) {
        String query = "INSERT INTO customer (name, last_name, document_type, number_document, phone, email, state) VALUES (?, ?, ?, ?, ?, ?, ?)";  // Cambiado a customer

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, customer.getFirst_name()); // Cambiado a "name"
            pstmt.setString(2, customer.getLast_name());
            pstmt.setString(3, customer.getDocument_type());
            pstmt.setString(4, customer.getDocument_number()); // Cambiado a "number_document"
            pstmt.setString(5, customer.getMobile()); // Cambiado a "phone"
            pstmt.setString(6, customer.getEmail());
            pstmt.setDate(7, new java.sql.Date(customer.getState().getTime()));

            pstmt.executeUpdate();
            System.out.println("Pedido creado exitosamente.");
        } catch (SQLException e) {
            System.out.println("Error al crear el pedido.");
            e.printStackTrace();
        }
    }

    /* Editar un pedido existente */
    public void editarPedido(Customer customer) {
        String query = "UPDATE customer SET name = ?, last_name = ?, document_type = ?, number_document = ?, phone = ?, email = ?, state = ? WHERE id = ?";  // Cambiado a customer

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, customer.getFirst_name()); // Cambiado a "name"
            pstmt.setString(2, customer.getLast_name());
            pstmt.setString(3, customer.getDocument_type());
            pstmt.setString(4, customer.getDocument_number()); // Cambiado a "number_document"
            pstmt.setString(5, customer.getMobile()); // Cambiado a "phone"
            pstmt.setString(6, customer.getEmail());
            pstmt.setDate(7, new java.sql.Date(customer.getState().getTime()));
            pstmt.setInt(8, customer.getId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Pedido actualizado exitosamente.");
            } else {
                System.out.println("No se encontró un pedido con el ID especificado.");
            }
        } catch (SQLException e) {
            System.out.println("Error al actualizar el pedido.");
            e.printStackTrace();
        }
    }

    /* Buscar un pedido por ID */
    public Customer buscarPedidoPorId(int id) {
        Customer customer = null;
        String query = "SELECT * FROM customer WHERE id = ?";  // Cambiado a customer (en minúsculas)

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                        rs.getInt("id"),
                        rs.getString("name"), // Cambiado a "name"
                        rs.getString("last_name"),
                        rs.getString("document_type"),
                        rs.getString("number_document"), // Cambiado a "number_document"
                        rs.getString("phone"), // Cambiado a "phone"
                        rs.getString("email"),
                        rs.getDate("state")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar el pedido por ID.");
            e.printStackTrace();
        }
        return customer;
    }

    /* Eliminar un pedido */
    public void eliminarPedido(int id) {
        String query = "DELETE FROM customer WHERE id = ?";  // Cambiado a customer

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Pedido eliminado exitosamente.");
            } else {
                System.out.println("No se encontró un pedido con el ID especificado.");
            }
        } catch (SQLException e) {
            System.out.println("Error al eliminar el pedido.");
            e.printStackTrace();
        }
    }
}
