<%@ page import="pe.edu.vallegrande.dto.Customer" %>
<%@ page import="pe.edu.vallegrande.Controller.CustomerController" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Editar Pedido</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


    <!-- Custom CSS -->
    <style>
        /* General Styles */
        body, html {
            height: 100%;
        }

        #wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        #sidebar-wrapper {
            min-width: 250px;
            max-width: 250px;
            background-color: #1e2125;
            padding-top: 20px;
            position: fixed;
            height: 100%;
        }

        #sidebar-wrapper .list-group-item {
            background-color: #1e2125;
            color: #c9c9c9;
            border: none;
            padding: 15px;
            font-size: 1.1em;
        }

        #sidebar-wrapper .list-group-item:hover {
            background-color: #343a40;
            color: #fff;
        }

        #sidebar-wrapper .list-group-item.active {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        /* Page Content */
        #page-content-wrapper {
            width: 100%;
            padding: 20px;
            margin-left: 250px;
        }

        /* Navbar */
        .navbar {
            background-color: #343a40;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Card Shadows */
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Form input styles */
        .form-control {
            border-radius: 5px;
            padding: 10px;
            font-size: 1rem;
        }

        .form-label {
            font-weight: bold;
            font-size: 1rem;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 20px;
            font-size: 1rem;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            padding: 10px 20px;
            font-size: 1rem;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            padding: 10px 20px;
            font-size: 1rem;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            padding: 10px 20px;
            font-size: 1rem;
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<!-- Sidebar -->
<div class="sidebar">
    <h2>MULTISERVICIOS "AkiExpress"</h2>
    <a href="#"><i class="bi bi-house-door-fill"></i> Inicio</a>
    <a href="listadoProductos.jsp"><i class="bi bi-box-seam"></i> Productos</a>
    <a href="ventas.jsp"><i class="bi bi-receipt-cutoff"></i> Ventas</a>
    <a href="listadoCustomer.jsp"><i class="bi bi-list-check"></i> Orden</a>
</div>

<!-- CSS for Sidebar -->
<style>
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
    }
</style>


<!-- Page Content -->
<div id="page-content-wrapper">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand ms-3" href="#">AkiExpress</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Perfil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Salir</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Content -->
    <div class="container-fluid px-4">
        <h1 class="mt-4">Editar Pedido</h1>

        <!-- Cargar datos del pedido -->
        <%
            int customerId = Integer.parseInt(request.getParameter("id"));
            CustomerController customerController = new CustomerController();
            Customer customer = customerController.buscarPedidoPorId(customerId);
        %>

        <!-- Formulario para editar el pedido -->
        <div class="card mb-4">
            <div class="card-header">
                Editar Pedido
            </div>
            <div class="card-body">
                <form action="OrderServlet" method="post">
                <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id" value="<%= customer.getId() %>">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="first_name" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="first_name" name="first_name" value="<%= customer.getFirst_name() %>" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="last_name" class="form-label">Apellido</label>
                            <input type="text" class="form-control" id="last_name" name="last_name" value="<%= customer.getLast_name() %>" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="document_type" class="form-label">Tipo de Documento</label>
                            <input type="text" class="form-control" id="document_type" name="document_type" value="<%= customer.getDocument_type() %>" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="document_number" class="form-label">Numero de Documento</label>
                            <input type="text" class="form-control" id="document_number" name="document_number" value="<%= customer.getDocument_number() %>" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label for="mobile" class="form-label">Celular</label>
                            <input type="text" class="form-control" id="mobile" name="mobile" value="<%= customer.getMobile() %>" required>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="email" class="form-label">Correo Electrónico</label>
                            <input type="text" step="0.01" class="form-control" id="email" name="email" value="<%= customer.getEmail() %>" required>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="state" class="form-label">Estado</label>
                            <input type="date" step="0.01" class="form-control" id="state" name="state" value="<%= customer.getState() %>" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Guardar Cambios</button>
                    <a href="listadoCustomer.jsp" class="btn btn-secondary">Cancelar</a>
                </form>
            </div>
        </div>
    </div>

</div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


</body>

</html>