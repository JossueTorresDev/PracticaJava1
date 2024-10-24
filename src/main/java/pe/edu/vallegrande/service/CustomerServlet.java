package pe.edu.vallegrande.service;

import pe.edu.vallegrande.Controller.CustomerController;
import pe.edu.vallegrande.dto.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/OrderServlet")
public class CustomerServlet extends HttpServlet {

    private CustomerController customerController = new CustomerController();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            // Eliminar pedido
            int customerId = Integer.parseInt(request.getParameter("id"));
            customerController.eliminarPedido(customerId);
            response.sendRedirect("listadoCustomer.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Ajusta el formato según el formato de la fecha en tu formulario

        if ("add".equals(action)) {
            // Agregar un nuevo pedido
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String document_type = request.getParameter("document_type");
            String document_number = request.getParameter("document_number");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");

            // Convertir el estado a Date
            Date state = null;
            try {
                String stateStr = request.getParameter("state");
                state = new java.sql.Date(dateFormat.parse(stateStr).getTime());
            } catch (ParseException e) {
                e.printStackTrace(); // Manejo de excepción por si la fecha no se puede parsear
            }

            Customer nuevoPedido = new Customer();
            nuevoPedido.setFirst_name(first_name);
            nuevoPedido.setLast_name(last_name);
            nuevoPedido.setDocument_type(document_type);
            nuevoPedido.setDocument_number(document_number);
            nuevoPedido.setMobile(mobile);
            nuevoPedido.setEmail(email);
            nuevoPedido.setState(state);

            customerController.agregarPedido(nuevoPedido);
            response.sendRedirect("listadoCustomer.jsp");

        } else if ("edit".equals(action)) {
            // Editar un pedido existente
            int customerId = Integer.parseInt(request.getParameter("id"));
            String first_name = request.getParameter("first_name"); // Cambiado a "first_name"
            String last_name = request.getParameter("last_name"); // Cambiado a "last_name"
            String document_type = request.getParameter("document_type"); // Cambiado a "document_type"
            String document_number = request.getParameter("document_number"); // Cambiado a "document_number"
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");

            // Convertir el estado a Date
            Date state = null;
            try {
                String stateStr = request.getParameter("state");
                state = new java.sql.Date(dateFormat.parse(stateStr).getTime());
            } catch (ParseException e) {
                e.printStackTrace(); // Manejo de excepción por si la fecha no se puede parsear
            }

            Customer pedidoEditado = new Customer();
            pedidoEditado.setId(customerId);
            pedidoEditado.setFirst_name(first_name);
            pedidoEditado.setLast_name(last_name);
            pedidoEditado.setDocument_type(document_type);
            pedidoEditado.setDocument_number(document_number);
            pedidoEditado.setMobile(mobile);
            pedidoEditado.setEmail(email);
            pedidoEditado.setState(state);

            customerController.editarPedido(pedidoEditado);
            response.sendRedirect("listadoCustomer.jsp");
        }
    }
}
