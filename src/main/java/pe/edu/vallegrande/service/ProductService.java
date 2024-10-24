package pe.edu.vallegrande.service;

import pe.edu.vallegrande.Controller.ProductController;
import pe.edu.vallegrande.dto.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({
        "/ProductService",
        "/editarProduct",
        "/agregarProduct",
        "/eliminarProduct",
        "/listarProductos"
})
public class ProductService extends HttpServlet {

    private final ProductController productController = new ProductController();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/ProductService":
            case "/listarProductos":
                listarProductos(request, response);
                break;
            case "/agregarProduct":
                agregarProducto(request, response);
                break;
            case "/editarProduct":
                editarProducto(request, response);
                break;
            case "/eliminarProduct":
                eliminarProducto(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void agregarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            int amount = Integer.parseInt(request.getParameter("amount"));
            double price = Double.parseDouble(request.getParameter("price"));
            String product_code = request.getParameter("product_code");

            Product nuevoProducto = new Product();
            nuevoProducto.setProductName(productName);
            nuevoProducto.setDescription(description);
            nuevoProducto.setAmount(amount);
            nuevoProducto.setPrice(price);
            nuevoProducto.setProduct_code(product_code);

            productController.agregarProducto(nuevoProducto);
            response.sendRedirect("listadoProductos.jsp");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de número inválido.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error: " + e.getMessage());
        }
    }

    private void editarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            int amount = Integer.parseInt(request.getParameter("amount"));
            double price = Double.parseDouble(request.getParameter("price"));
            String product_code = request.getParameter("product_code");

            Product productoEditado = new Product();
            productoEditado.setId(productId);
            productoEditado.setProductName(productName);
            productoEditado.setDescription(description);
            productoEditado.setAmount(amount);
            productoEditado.setPrice(price);
            productoEditado.setProduct_code(product_code);

            productController.editarProducto(productoEditado);
            response.sendRedirect("listadoProductos.jsp");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de número inválido.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error: " + e.getMessage());
        }
    }

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            productController.eliminarProducto(productId);
            response.sendRedirect("listadoProductos.jsp");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID de producto inválido.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error: " + e.getMessage());
        }
    }

    private void listarProductos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Product> products = productController.listarTodos(); // Asegúrate de que este método retorne una lista válida
            request.setAttribute("products", products); // Agrega la lista de productos a la solicitud
            request.getRequestDispatcher("/listadoProductos.jsp").forward(request, response); // Redirige a listadoProductos.jsp
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error al listar los productos: " + e.getMessage());
        }
    }
}
