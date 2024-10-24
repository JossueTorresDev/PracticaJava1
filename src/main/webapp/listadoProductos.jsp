<%@ page import="pe.edu.vallegrande.dto.Product" %>
<%@ page import="pe.edu.vallegrande.Controller.ProductController" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Listado de Productos</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* General Styles */
        body {
            background-color: #f8f9fa;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #3b3ac6;
            padding: 20px;
            position: fixed;
            color: white;
        }

        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            padding: 10px;
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
        }

        .sidebar a:hover {
            background-color: #4b4ae6;
        }

        /* Content */
        .content {
            margin-left: 270px;
            padding: 20px;
        }

        /* Form */
        .form-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            margin-bottom: 10px;
        }

        /* Table */
        .table-container {
            margin-top: 20px;
        }

        .table thead {
            background-color: #b79fff;
        }

        .btn-danger {
            background-color: #ff4b4b;
        }

        /* Header */
        .header {
            background-color: #fff;
            padding: 10px;
            text-align: right;
            border-bottom: 2px solid #e9ecef;
        }

        .header .user-icon {
            margin-right: 10px;
            display: inline-block;
        }

        .header h2 {
            display: inline-block;
            font-size: 18px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .header {
                text-align: center;
            }
        }

        @media (max-width: 576px) {
            .header h2 {
                font-size: 16px;
            }
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>MULTISERVICIOS "AkiExpress"</h2>
    <a href="#"><i class="bi bi-house-door-fill"></i> Inicio</a>
    <a href="listadoProductos.jsp"><i class="bi bi-box-seam"></i> Productos</a>
    <a href="ventas.jsp"><i class="bi bi-receipt-cutoff"></i> Ventas</a>
    <a href="listadoCustomer.jsp"><i class="bi bi-list-check"></i> Orden</a>
</div>

<!-- Content -->
<div class="content">
    <div class="header">
        <div class="user-icon"><i class="bi bi-person-circle"></i></div>
        <h2>Bienvenido a AkiExpress</h2>
    </div>

    <h1 class="mt-4">Listado de Productos</h1>

    <!-- Formulario de registro -->
    <div class="form-container">
        <form action="ProductServlet" method="post">
            <input type="hidden" name="action" value="add">
            <div class="row">
                <div class="col-md-6">
                    <label for="productName">Nombre del Producto</label>
                    <input type="text" class="form-control" id="productName" name="productName" required>
                </div>
                <div class="col-md-6">
                    <label for="description">Descripción</label>
                    <input type="text" class="form-control" id="description" name="description" required>
                </div>
            </div>
            <div class="row">  <!-- Wrap in row for better layout -->
                <div class="col-md-6">
                    <label for="amount">Cantidad</label>
                    <input type="number" class="form-control" id="amount" name="amount" required min="0" step="1">
                </div>
                <div class="col-md-6">
                    <label for="price">Precio</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="product_code">Código del Producto</label>
                    <input type="text" class="form-control" id="product_code" name="product_code" required>
                </div>
            </div>
            <button type="submit" class="btn btn-success mt-3">Agregar Producto</button>
        </form>
    </div>

    <!-- Tabla de productos -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Producto Código</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <%
                ProductController productController = new ProductController();
                List<Product> products = productController.listarTodos();
                if (products.isEmpty()) {
            %>
            <tr>
                <td colspan="6" class="text-center">No hay productos disponibles por el momento.</td>
            </tr>
            <%
            } else {
                for (Product product : products) {
            %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getProductName() %></td>
                <td><%= product.getDescription() %></td>
                <td><%= product.getAmount() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getProduct_code() %></td>
                <td>
                    <a href="editarProducto.jsp?id=<%= product.getId() %>" class="btn btn-primary btn-sm">Editar</a>
                    <a href="ProductServlet?action=delete&id=<%= product.getId() %>" class="btn btn-danger btn-sm">Eliminar</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>