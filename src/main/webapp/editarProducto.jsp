<%@ page import="pe.edu.vallegrande.dto.Product" %>
<%@ page import="pe.edu.vallegrande.Controller.ProductController" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Producto - AkiExpress</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            background-color: #f8f9fa;
        }

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
        .content {
            margin-left: 270px;
            padding: 20px;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            margin-bottom: 10px;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            padding: 10px 20px;
            font-size: 1rem;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            padding: 10px 20px;
            font-size: 1rem;
        }

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

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .sidebar a {
                text-align: center;
                padding: 15px;
            }
            .content {
                margin-left: 0;
            }
            .header {
                text-align: center;
            }
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>MULTISERVICIOS "AkiExpress"</h2>
    <a href="#"><i class="bi bi-house-door-fill"></i> Inicio</a>
    <a href="Ordenes.jsp"><i class="bi bi-card-list"></i> Órdenes</a>
    <a href="#"><i class="bi bi-people-fill"></i> Clientes</a>
    <a href="#"><i class="bi bi-box-seam"></i> Inventario</a>
</div>

<!-- Header -->
<div class="header">
    <span class="user-icon"><i class="bi bi-person-circle"></i> Usuario</span>
</div>

<!-- Content -->
<div class="content">
    <h1>Editar Producto</h1>

    <%
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductController productController = new ProductController();
        Product product = productController.buscarProductoPorId(productId);
    %>

    <div class="form-container">
        <form action="ProductServlet" method="post" class="row g-3">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="<%= product.getId() %>">
            <div class="col-md-6">
                <label for="productName" class="form-label">Nombre del Producto</label>
                <input type="text" class="form-control" id="productName" name="productName" value="<%= product.getProductName() %>" required>
            </div>
            <div class="col-md-6">
                <label for="description" class="form-label">Descripción</label>
                <input type="text" class="form-control" id="description" name="description" value="<%= product.getDescription() %>" required>
            </div>
            <div class="col-md-6">
                <label for="amount" class="form-label">Cantidad</label>
                <input type="number" step="0.01" class="form-control" id="amount" name="amount" value="<%= product.getAmount() %>" required>
            </div>
            <div class="col-md-6">
                <label for="price" class="form-label">Precio</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" required>
            </div>
            <div class="col-md-6">
                <label for="product_code" class="form-label">Producto Codigo</label>
                <input type="text" step="0.01" class="form-control" id="product_code" name="product_code" value="<%= product.getProduct_code() %>" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-success">Guardar Cambios</button>
                <a href="listadoProductos.jsp" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>